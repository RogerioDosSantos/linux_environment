#!/bin/bash

# Functions

Log()
{
  # Log <type> <level> <message> <detail>

  if [ "${config_log_enabled}" != "1" ]; then
    return 0
  fi

  local log_type=$1
  local log_level=$2
  local log_message=$3
  local log_detail=$4
  local log_date="$(date '+%Y-%m-%d %H:%M:%S')"
  local log_caller=${FUNCNAME[1]}
  echo "${log_date},${log_type},${log_level},${log_caller},${log_message},${log_detail}"
}

Init()
{
  # Setup - Go to the directory where the bash file is
  g_script_name="$(basename "$0")"
  g_caller_dir=$(pwd)
  cd "$(dirname "$0")"
  g_script_dir=$(pwd)
}

End()
{
  Log "info" "5" "Returning to caller directory" "${g_caller_dir}"
  cd "${g_caller_dir}"
}

ErrorHandler()
{
  # Usage: ErrorHandler <last_line>
  local last_line=$1
  Log "error" "1" "Last line executed" "${last_line}"
  End
  exit 1
}

ScriptDetail()
{
  Log "info" "5" "Script Name" "${g_script_name}"
  Log "info" "5" "Caller Directory" "${g_caller_dir}"
  Log "info" "5" "Script Directory" "${g_script_dir}"
}

DisplayHelp()
{
  echo "${g_script_name/.sh/} --<command> [<command_options>]"
  echo " "
  echo "- Commands:"
  echo "--help (h) : Display this command help"
  echo "--log_enable (-le) : Enable log"
  echo "--log_level (-ll) <level>: Define the Log Level (Default: ${config_log_level})"
  echo "--log_type (-lt) <type>: Define the Log Type [Options: all, error, warning, info] (Default: ${config_log_type})"
  echo " "
}

GetConfiguration()
{
  config_log_enabled="0"
  config_log_level="1"
  config_log_type="all"
  while [[ $# != 0 ]]; do
      case $1 in
          --log_enable|-le)
            config_log_enabled="1"
            Log "info" "1" "Log Enabled" ""
            shift 1
            ;;
          --log_level|-le)
            config_log_level="$2"
            Log "info" "1" "Log Level" "${config_log_level}"
            shift 2
            ;;
          --log_type|-lt)
            config_log_type="$2"
            Log "info" "1" "Log Type" "${config_log_type}"
            shift 2
            ;;
          --)
              shift
              break
              ;;
          --help|-h)
              DisplayHelp
              exit
              ;;
          -*)
              Log "error" "1" "Unknown option" "$1"
              DisplayHelp
              exit
              ;;
          *)
              break
              ;;
      esac
  done
}

IsSubmoduleInitialized()
{
  # Usage IsSubmoduleInitialized <out:result> <in:submodule_path>
  local result=$1
  local submodule_path=$2

  local status="$(git submodule status ${submodule_path})"
  if [ "${status:0:1}" == "-" ]; then
    eval $result=false
    return 0
  fi

  eval $result=true
}

InitSubModule()
{
  # Usage: InitSubModule <in:submodule_path>
  local submodule_path=$1

  local is_initialized=""
  IsSubmoduleInitialized is_initialized "${submodule_path}"
  if [ "${is_initialized}" == "false" ]; then
    Log "info" "5" "Initializing submodule" "${submodule_path}"
    git submodule update --init ${submodule_path}
  fi
}

MainFunction()
{
  cd "${g_script_dir}/../../../"

  local workspace_dir="$(pwd)"
  InitSubModule "projects/wiki"
  InitSubModule "productivity/scripts"
  InitSubModule "productivity/templates/cpp/project"
}

# Main

set -E
trap 'ErrorHandler $LINENO' ERR

Init
GetConfiguration "$@"
ScriptDetail
MainFunction
End 

