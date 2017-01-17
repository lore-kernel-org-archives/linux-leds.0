From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 6/6] dell-led: move driver to
 drivers/platform/x86/dell-wmi-led.c
Date: Tue, 17 Jan 2017 12:08:09 +0100
Message-ID: <20170117110809.GC26116@xo-6d-61-c0.localdomain>
References: <20170116132204.6421-1-kernel@kempniu.pl>
 <20170116132204.6421-7-kernel@kempniu.pl>
 <b702265e-893e-e3b1-1262-f959d230d552@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b702265e-893e-e3b1-1262-f959d230d552@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Richard Purdie <rpurdie@rpsys.net>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Anthony Wong <anthony.wong@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi!

> Thanks for the patch set.
> 
> Would you mind fixing also the following issues raised by
> checkpatch.pl?:
> 
> WARNING: Missing a blank line after declarations
> #376: FILE: drivers/platform/x86/dell-wmi-led.c:64:
> +	struct bios_args args;
...
> The fixes could be placed in an incremental patch after this one.

Anyway, move itself is ok (and the checkpatch issues are not that serious anyway.)

Thanks,

Acked-by: Pavel Machek <pavel@ucw.cz>

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
