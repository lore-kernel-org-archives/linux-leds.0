From: Fabio Estevam <festevam@gmail.com>
Subject: pwm-led turns on during suspend
Date: Fri, 17 Nov 2017 10:31:23 -0200
Message-ID: <CAOMZO5BukO0LmYL7D+nyozGJzkDZiqUo_bNAUJT7RkkYkJUvhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33034 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755302AbdKQMbY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Nov 2017 07:31:24 -0500
Received: by mail-oi0-f46.google.com with SMTP id f135so1531597oib.0
        for <linux-leds@vger.kernel.org>; Fri, 17 Nov 2017 04:31:24 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: jacek.anaszewski@gmail.com, Richard Purdie <rpurdie@rpsys.net>, Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>

Hi,

On a imx6q-cubox-i board there is an LED controlled via pwm-leds and
it works as expected:

# cd /sys/class/leds/imx6\:red\:front/
# echo 248 > brightness  (LED is turned on with its maximum brightness)
# echo 0 > brightness (LED is turned off)

However after entering in suspend mode:

# echo enabled > /sys/class/tty/ttymxc0/power/wakeup
# echo mem > /sys/power/state

The LED is turned on with its maximum brightness.

Press a key in the console, system resumes and LED is turned off.

I would expect that the LED gets turned off in suspend, but this is
not happening.

Any ideas?

Thanks,

Fabio Estevam
