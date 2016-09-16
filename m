From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [ISSUE] Memleak in LED sysfs on heavy usage
Date: Fri, 16 Sep 2016 09:31:58 +0200
Message-ID: <37b949b3-6a9a-b8e3-c164-5ac2d44c9b3c@samsung.com>
References: <CGME20160912085832eucas1p1e7332f761e5e0cb764a6831b9a519b70@eucas1p1.samsung.com>
 <d3cf2089-794f-f156-c5b9-ed749076c0dd@esd.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34738 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752388AbcIPHcE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Sep 2016 03:32:04 -0400
In-reply-to: <d3cf2089-794f-f156-c5b9-ed749076c0dd@esd.eu>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Daniel Gorsulowski <daniel.gorsulowski@esd.eu>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Daniel,

On 09/12/2016 10:50 AM, Daniel Gorsulowski wrote:
> Hello!
>
> Please consider if I made something wrong, sending this issue. This is
> my first contact to the LKML.
> By mistake, I accessed an LED via /sys/class/leds subsystem very fast in
> an user application. I figured out, that the free user memory decreased
> constantly. So I tried to analyze the Problem and wrote a litte script:
>
> #!/bin/sh
> while [ 1 ]; do
>         echo 1 > /sys/class/leds/2a_service_yellow/brightness
>         echo 0 > /sys/class/leds/2a_service_yellow/brightness
> done
>
> And voila, I was able to reproduce the problem.
> So I add a bit more debugging:
>
> #!/bin/sh
> cnt=0
> while [ 1 ]; do
>         if [ `expr $cnt % 1000` -eq 0 ]; then
>                 free | grep Mem: | cut -d' ' -f25
>         fi
>         echo 1 > /sys/class/leds/2a_service_yellow/brightness
>         echo 0 > /sys/class/leds/2a_service_yellow/brightness
>         let "cnt++"
> done
>
> And huh? No memory is eaten anymore. So it looks like, the problem only
> occours on heavy (fast) usage of /sys/class/leds subsystem.
>
> I rewrote the script and toggled a GPIO pin, but there was no problem
> recognizable.

I've been unable to reproduce the problem with leds-aat1290 driver
and Samsung M0 board. It must be driver specific issue.
What driver did you use?

>
> Some details about my test environment:
> Hardware: Ti Sitara AM3357ZCZ with 128MiB memory
> Kernel: vanilla 4.6
>
> The relevant part of my .dts:
> #include "am33xx.dtsi"
>
> / {
> ...
>     cpus {
>         cpu@0 {
>             cpu0-supply = <&dcdc2_reg>;
>             operating-points = <
>                 /* kHz    uV */
>                 800000  1300000
>                 600000  1112000
>                 300000   969000
>             >;
>         };
>     };
>
>     memory {
>         device_type = "memory";
>         reg = <0x80000000 0x08000000>; /* 128 Mib */
>     };
> ...
>
>     leds {
>         pinctrl-names = "default";
>         pinctrl-0 = <&user_leds_s0>;
>
>         compatible = "gpio-leds";
>
> ...
>         led2 {
>             label = "2a_service_yellow";
>             gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
>             linux,default-trigger = "2a_service_yellow";
>             default-state = "off";
>         };
>
> ...
>     };
> ...
> };
>
> &am33xx_pinmux {
>     pinctrl-names = "default";
>     pinctrl-0 = <&gpio_misc_pins>;
>
> ...
>     user_leds_s0: user_leds_s0 {
>         pinctrl-single,pins = <
> ...
>             0x24 (PIN_OUTPUT_PULLDOWN | MUX_MODE7) /* (T10)
> gpmc_ad9.gpio0[23] */
>         >;
>     };
> ...
> };
> ...
>
> Kind regards
> Daniel
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>


-- 
Best regards,
Jacek Anaszewski
