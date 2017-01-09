From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 3/7] ALSA: hda - use dell_micmute_led_set() instead of
 dell_app_wmi_led_set()
Date: Mon, 9 Jan 2017 14:26:31 +0100
Message-ID: <20170109132631.GA14411@ozzy.nask.waw.pl>
References: <20161208123618.28603-1-kernel@kempniu.pl>
 <20161208123618.28603-4-kernel@kempniu.pl>
 <201612111140.38170@pali>
 <20161215144628.GB22695@kmp-mobile.hq.kempniu.pl>
 <1481816580.2090.5.camel@Pali-Nokia-N900>
 <20161215192253.GA4776@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161215192253.GA4776@kmp-mobile.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Bob Rodgers <Robert_Rodgers@dell.com>, Louis Davis <Louis_Davis@dell.com>, Jim Dailey <Jim_Dailey@dell.com>, Alex Hung <alex.hung@canonical.com>, Hui Wang <hui.wang@canonical.com>, Anthony Wong <anthony.wong@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

> > On Thu Dec 15 15:46:28 2016 Michał Kępień <kernel@kempniu.pl> wrote:
> > > > On Thursday 08 December 2016 13:36:14 Michał Kępień wrote:
> > > > > --- a/sound/pci/hda/dell_wmi_helper.c
> > > > > +++ b/sound/pci/hda/dell_wmi_helper.c
> > > > > @@ -6,7 +6,7 @@
> > > > > #include <linux/dell-led.h>
> > > > > 
> > > > > static int dell_led_value;
> > > > > -static int (*dell_led_set_func)(int, int);
> > > > > +static int (*dell_led_set_func)(int);
> > > > 
> > > > Suggestion: what about changing name to dell_micmute_led_set_func to 
> > > > match real function name which is used after this patch?
> > > 
> > > While I like the idea itself, implementing it will double the number of
> > > lines that this patch changes (6 vs. 12), arguably making its intention
> > 
> > If some patch makes final result of code better then metric number of lines is not priority.
> > 
> > > less clear.   Please let me know if you would really like this to happen
> > > (perhaps as a separate patch?), otherwise I will skip this idea in v2.
> > > 
> > > -- 
> > > Best regards,
> > > Michał Kępień
> > 
> > If it will be in this or another following patch... I dot care. But this is sound subsystem, so sound maintainers need to decide what they prefer.
> 
> Good point.  Jaroslav, Takashi, I will patiently wait for your opinion
> on this patch and Pali's suggestion quoted above before I post v2 of
> this series.

As it has already been a month since I posted this patch series, this is
just a reminder that I am waiting for comments from the sound subsystem
maintainers before I post v2.

Jaroslav, Takashi, I could really use your input.  Please let me know if
something is unclear.  Thanks,

-- 
Best regards,
Michał Kępień
