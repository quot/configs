#!/usr/bin/env nu

def --env setjava [javaVersion?: string = "21"] {
  match $javaVersion {
    "8" | "1.8" => {
        $env.JAVA_HOME = '/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home'
        $env.JRE_HOME  = '/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home/jre'
        $env.JAVA_VERSION = '1.8'
      },
    "11" => {
        $env.JAVA_HOME = '/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home'
        hide-env -i JRE_HOME
        $env.JAVA_VERSION = '11'
      },
    "17" => {
        $env.JAVA_HOME = '/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home'
        hide-env -i JRE_HOME
        $env.JAVA_VERSION = '17'
      },
    "21" => {
        $env.JAVA_HOME = '/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home'
        hide-env -i JRE_HOME
        $env.JAVA_VERSION = '21'
      },
    _ => { echo $"Error: Java version [($javaVersion)] not supported." }
  }
}
