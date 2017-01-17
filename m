From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 5/6] dell-led: remove code related to mic mute LED
Date: Tue, 17 Jan 2017 12:24:54 +0100
Message-ID: <20170117112454.GC32502@pali>
References: <20170116132204.6421-1-kernel@kempniu.pl>
 <20170116132204.6421-6-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170116132204.6421-6-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Anthony Wong <anthony.wong@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Monday 16 January 2017 14:22:03 Michał Kępień wrote:
> With dell_micmute_led_set() moved to drivers/platform/x86/dell-laptop.c,
> all remnants of the mic mute LED handling code can be removed from
> drivers/leds/dell-led.c, restoring it back to the state it was in before
> commit db6d8cc00773 ("dell-led: add mic mute led interface").
> 
> Signed-off-by: Michał Kępień <kernel@kempniu.pl>

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

-- 
Pali Rohár
pali.rohar@gmail.com
