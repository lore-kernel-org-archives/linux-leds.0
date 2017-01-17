From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 6/6] dell-led: move driver to
 drivers/platform/x86/dell-wmi-led.c
Date: Tue, 17 Jan 2017 12:28:17 +0100
Message-ID: <20170117112817.GD32502@pali>
References: <20170116132204.6421-1-kernel@kempniu.pl>
 <20170116132204.6421-7-kernel@kempniu.pl>
 <b702265e-893e-e3b1-1262-f959d230d552@gmail.com>
 <20170117110809.GC26116@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170117110809.GC26116@xo-6d-61-c0.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Richard Purdie <rpurdie@rpsys.net>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Anthony Wong <anthony.wong@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tuesday 17 January 2017 12:08:09 Pavel Machek wrote:
> Hi!
> 
> > Thanks for the patch set.
> > 
> > Would you mind fixing also the following issues raised by
> > checkpatch.pl?:
> > 
> > WARNING: Missing a blank line after declarations
> > #376: FILE: drivers/platform/x86/dell-wmi-led.c:64:
> > +	struct bios_args args;
> ...
> > The fixes could be placed in an incremental patch after this one.
> 
> Anyway, move itself is ok (and the checkpatch issues are not that serious anyway.)
> 
> Thanks,
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>

Yes, this patch does not change code, just move one file to other
location. You can add my Reviewed-by.

-- 
Pali Rohár
pali.rohar@gmail.com
