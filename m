From: Daniel Gorsulowski <daniel.gorsulowski@esd.eu>
Subject: Re: [ISSUE] Memleak in LED sysfs on heavy usage
Date: Fri, 16 Sep 2016 10:15:49 +0200
Message-ID: <d78a668f-f2fa-da5e-7895-c3fc0ef272e7@esd.eu>
References: <37b949b3-6a9a-b8e3-c164-5ac2d44c9b3c@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mxu02.htp-tel.de ([81.14.242.9]:53765 "EHLO mxuout02.htp-tel.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752032AbcIPIQD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Sep 2016 04:16:03 -0400
In-Reply-To: <37b949b3-6a9a-b8e3-c164-5ac2d44c9b3c@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Jacek,

Am 16.09.2016 um 09:31 schrieb Jacek Anaszewski:
> Hi Daniel,
>
> On 09/12/2016 10:50 AM, Daniel Gorsulowski wrote:
>> Hello!
>>
>> Please consider if I made something wrong, sending this issue. This is
>> my first contact to the LKML.
>> By mistake, I accessed an LED via /sys/class/leds subsystem very fast in
>> an user application. I figured out, that the free user memory decreased
>> constantly. So I tried to analyze the Problem and wrote a litte script:
>>
>> #!/bin/sh
>> while [ 1 ]; do
>>         echo 1 > /sys/class/leds/2a_service_yellow/brightness
>>         echo 0 > /sys/class/leds/2a_service_yellow/brightness
>> done
>>
>> And voila, I was able to reproduce the problem.
>> So I add a bit more debugging:
>>
>> #!/bin/sh
>> cnt=0
>> while [ 1 ]; do
>>         if [ `expr $cnt % 1000` -eq 0 ]; then
>>                 free | grep Mem: | cut -d' ' -f25
>>         fi
>>         echo 1 > /sys/class/leds/2a_service_yellow/brightness
>>         echo 0 > /sys/class/leds/2a_service_yellow/brightness
>>         let "cnt++"
>> done
>>
>> And huh? No memory is eaten anymore. So it looks like, the problem only
>> occours on heavy (fast) usage of /sys/class/leds subsystem.
>>
>> I rewrote the script and toggled a GPIO pin, but there was no problem
>> recognizable.
>
> I've been unable to reproduce the problem with leds-aat1290 driver
> and Samsung M0 board. It must be driver specific issue.
> What driver did you use?
>
I defined LEDS_GPIO and so I'm using leds-gpio driver.
danielg@debby:~/opt/prj/ti-linux-kernel$ cat .config | grep LEDS | grep 
-v "^# "
CONFIG_INPUT_LEDS=y
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
CONFIG_LEDS_TRIGGER_ONESHOT=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
CONFIG_LEDS_TRIGGER_GPIO=y
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
CONFIG_LEDS_TRIGGER_TRANSIENT=y

>>
>> Some details about my test environment:
>> Hardware: Ti Sitara AM3357ZCZ with 128MiB memory
>> Kernel: vanilla 4.6
>>
>> The relevant part of my .dts:
>> #include "am33xx.dtsi"
>>
>> / {
>> ...
>>     cpus {
>>         cpu@0 {
>>             cpu0-supply = <&dcdc2_reg>;
>>             operating-points = <
>>                 /* kHz    uV */
>>                 800000  1300000
>>                 600000  1112000
>>                 300000   969000
>>             >;
>>         };
>>     };
>>
>>     memory {
>>         device_type = "memory";
>>         reg = <0x80000000 0x08000000>; /* 128 Mib */
>>     };
>> ...
>>
>>     leds {
>>         pinctrl-names = "default";
>>         pinctrl-0 = <&user_leds_s0>;
>>
>>         compatible = "gpio-leds";
>>
>> ...
>>         led2 {
>>             label = "2a_service_yellow";
>>             gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
>>             linux,default-trigger = "2a_service_yellow";
>>             default-state = "off";
>>         };
>>
>> ...
>>     };
>> ...
>> };
>>
>> &am33xx_pinmux {
>>     pinctrl-names = "default";
>>     pinctrl-0 = <&gpio_misc_pins>;
>>
>> ...
>>     user_leds_s0: user_leds_s0 {
>>         pinctrl-single,pins = <
>> ...
>>             0x24 (PIN_OUTPUT_PULLDOWN | MUX_MODE7) /* (T10)
>> gpmc_ad9.gpio0[23] */
>>         >;
>>     };
>> ...
>> };
>> ...
>>
>> Kind regards
>> Daniel
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>>
>
>
