From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 3/6] ALSA: hda - rename dell_led_set_func to
 dell_micmute_led_set_func
Date: Tue, 17 Jan 2017 22:20:14 +0100
Message-ID: <ceb198ea-5864-349d-f0c8-6ecf337139cc@gmail.com>
References: <20170116132204.6421-1-kernel@kempniu.pl>
 <20170116132204.6421-4-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170116132204.6421-4-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Anthony Wong <anthony.wong@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Jaroslav, Takashi,

I need an ack from sound sybsystem maintainer.
Are you OK with this patch going through LED tree?

Best regards,
Jacek Anaszewski

On 01/16/2017 02:22 PM, Michał Kępień wrote:
> With dell_app_wmi_led_set() replaced by dell_micmute_led_set(), rename
> the function pointer to the latter for consistency.
> 
> Signed-off-by: Michał Kępień <kernel@kempniu.pl>
> ---
>  sound/pci/hda/dell_wmi_helper.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/pci/hda/dell_wmi_helper.c b/sound/pci/hda/dell_wmi_helper.c
> index e128c8096772..516237ad6ef5 100644
> --- a/sound/pci/hda/dell_wmi_helper.c
> +++ b/sound/pci/hda/dell_wmi_helper.c
> @@ -6,7 +6,7 @@
>  #include <linux/dell-led.h>
>  
>  static int dell_led_value;
> -static int (*dell_led_set_func)(int);
> +static int (*dell_micmute_led_set_func)(int);
>  static void (*dell_old_cap_hook)(struct hda_codec *,
>  			         struct snd_kcontrol *,
>  				 struct snd_ctl_elem_value *);
> @@ -18,7 +18,7 @@ static void update_dell_wmi_micmute_led(struct hda_codec *codec,
>  	if (dell_old_cap_hook)
>  		dell_old_cap_hook(codec, kcontrol, ucontrol);
>  
> -	if (!ucontrol || !dell_led_set_func)
> +	if (!ucontrol || !dell_micmute_led_set_func)
>  		return;
>  	if (strcmp("Capture Switch", ucontrol->id.name) == 0 && ucontrol->id.index == 0) {
>  		/* TODO: How do I verify if it's a mono or stereo here? */
> @@ -26,8 +26,8 @@ static void update_dell_wmi_micmute_led(struct hda_codec *codec,
>  		if (val == dell_led_value)
>  			return;
>  		dell_led_value = val;
> -		if (dell_led_set_func)
> -			dell_led_set_func(dell_led_value);
> +		if (dell_micmute_led_set_func)
> +			dell_micmute_led_set_func(dell_led_value);
>  	}
>  }
>  
> @@ -39,15 +39,15 @@ static void alc_fixup_dell_wmi(struct hda_codec *codec,
>  	bool removefunc = false;
>  
>  	if (action == HDA_FIXUP_ACT_PROBE) {
> -		if (!dell_led_set_func)
> -			dell_led_set_func = symbol_request(dell_micmute_led_set);
> -		if (!dell_led_set_func) {
> +		if (!dell_micmute_led_set_func)
> +			dell_micmute_led_set_func = symbol_request(dell_micmute_led_set);
> +		if (!dell_micmute_led_set_func) {
>  			codec_warn(codec, "Failed to find dell wmi symbol dell_micmute_led_set\n");
>  			return;
>  		}
>  
>  		removefunc = true;
> -		if (dell_led_set_func(false) >= 0) {
> +		if (dell_micmute_led_set_func(false) >= 0) {
>  			dell_led_value = 0;
>  			if (spec->gen.num_adc_nids > 1 && !spec->gen.dyn_adc_switch)
>  				codec_dbg(codec, "Skipping micmute LED control due to several ADCs");
> @@ -60,9 +60,9 @@ static void alc_fixup_dell_wmi(struct hda_codec *codec,
>  
>  	}
>  
> -	if (dell_led_set_func && (action == HDA_FIXUP_ACT_FREE || removefunc)) {
> +	if (dell_micmute_led_set_func && (action == HDA_FIXUP_ACT_FREE || removefunc)) {
>  		symbol_put(dell_micmute_led_set);
> -		dell_led_set_func = NULL;
> +		dell_micmute_led_set_func = NULL;
>  		dell_old_cap_hook = NULL;
>  	}
>  }
> 
