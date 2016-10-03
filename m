From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds/leds-lp5523.txt: make documentation match reality
Date: Mon, 03 Oct 2016 12:16:48 +0200
Message-ID: <a8744611-7218-acc6-d2a7-be0de0e04460@samsung.com>
References: <CGME20161003084214eucas1p1a2434bf80649baa8c602249b5ef05bdc@eucas1p1.samsung.com>
 <20161003084201.GA2685@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20161003084201.GA2685@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, trivial@kernel.org, milo kim <milo.kim@ti.com>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 10/03/2016 10:42 AM, Pavel Machek wrote:
>
> Files are visible all the time, so remove incorrect notes.
>
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>
> index 0dbbd27..0961a06 100644
> --- a/Documentation/leds/leds-lp5523.txt
> +++ b/Documentation/leds/leds-lp5523.txt
> @@ -34,8 +34,8 @@ There are two ways to run LED patterns.
>    Control interface for the engines:
>    x is 1 .. 3
>    enginex_mode : disabled, load, run
> -  enginex_load : microcode load (visible only in load mode)
> -  enginex_leds : led mux control (visible only in load mode)
> +  enginex_load : microcode load
> +  enginex_leds : led mux control
>
>    cd /sys/class/leds/lp5523:channel2/device
>    echo "load" > engine3_mode
>

Thanks for the patch.
For now applied to the for-4.10 branch of linux-leds.git,
nonetheless it would be good to consult the author.

Cc Milo.

-- 
Best regards,
Jacek Anaszewski
