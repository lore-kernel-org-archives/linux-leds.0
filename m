From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/7] dell-led: remove GUID check from
 dell_micmute_led_set()
Date: Fri, 9 Dec 2016 10:20:25 +0100
Message-ID: <20161209092025.GC9959@pali>
References: <20161208123618.28603-1-kernel@kempniu.pl>
 <20161208123618.28603-2-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161208123618.28603-2-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bob Rodgers <Robert_Rodgers@dell.com>, Louis Davis <Louis_Davis@dell.com>, Jim Dailey <Jim_Dailey@dell.com>, Alex Hung <alex.hung@canonical.com>, Hui Wang <hui.wang@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thursday 08 December 2016 13:36:12 Michał Kępień wrote:
> As dell_micmute_led_set() no longer uses the dell_wmi_perform_query()
> method, which was removed in 0c41a08 ("dell-led: use
> dell_smbios_send_request() for performing SMBIOS calls"), the
> DELL_APP_GUID check is redundant and thus can be safely removed.
> 
> Signed-off-by: Michał Kępień <kernel@kempniu.pl>
> ---
>  drivers/leds/dell-led.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/leds/dell-led.c b/drivers/leds/dell-led.c
> index b3d6e9c..e8e8f67 100644
> --- a/drivers/leds/dell-led.c
> +++ b/drivers/leds/dell-led.c
> @@ -51,9 +51,6 @@ static int dell_micmute_led_set(int state)
>  	struct calling_interface_buffer *buffer;
>  	struct calling_interface_token *token;
>  
> -	if (!wmi_has_guid(DELL_APP_GUID))
> -		return -ENODEV;
> -
>  	if (state == 0)
>  		token = dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE);
>  	else if (state == 1)

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

Anyway, you can remove DELL_APP_GUID from other places too...

-- 
Pali Rohár
pali.rohar@gmail.com
