From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: ledtrig-transient: Add SPDX license identifiers
Date: Wed, 10 Jan 2018 21:40:43 +0100
Message-ID: <d1c6aab4-735d-565d-1bc4-9fd77e82e589@gmail.com>
References: <20180110163540.8396-1-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180110163540.8396-1-shuahkh@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>, rpurdie@rpsys.net, pavel@ucw.cz, keescook@chromium.org, shuah@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Shuah,

Thanks for the patch.

On 01/10/2018 05:35 PM, Shuah Khan wrote:
> Replace GPL license statements with SPDX GPL-2.0 license identifiers
> and and correct the module license to GPLv2.
> 
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  drivers/leds/trigger/ledtrig-transient.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/ledtrig-transient.c
> index 7acce64b692a..f0578af858e7 100644
> --- a/drivers/leds/trigger/ledtrig-transient.c
> +++ b/drivers/leds/trigger/ledtrig-transient.c
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*

How about changing this whole block comment to "//"?
We did it already for drivers/leds/trigger/ledtrig-netdev.c,
present in linux-next. See related discussion with reference
to relevant Linus' guidelines in this matter [0].

>   * LED Kernel Transient Trigger
>   *
> @@ -8,10 +9,6 @@
>   * Design and use-case input from Jonas Bonn <jonas@southpole.se> and
>   * Neil Brown <neilb@suse.de>
>   *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - *
>   */
>  /*
>   * Transient trigger allows one shot timer activation. Please refer to
> @@ -238,4 +235,4 @@ module_exit(transient_trig_exit);
>  
>  MODULE_AUTHOR("Shuah Khan <shuahkhan@gmail.com>");
>  MODULE_DESCRIPTION("Transient LED trigger");
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("GPL v2");
> 

[0] https://www.mail-archive.com/netdev@vger.kernel.org/msg204598.html

-- 
Best regards,
Jacek Anaszewski
