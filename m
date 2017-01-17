From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 3/6] ALSA: hda - rename dell_led_set_func to
 dell_micmute_led_set_func
Date: Tue, 17 Jan 2017 12:12:08 +0100
Message-ID: <20170117111208.GA32502@pali>
References: <20170116132204.6421-1-kernel@kempniu.pl>
 <20170116132204.6421-4-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33460 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750923AbdAQLNF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Jan 2017 06:13:05 -0500
Content-Disposition: inline
In-Reply-To: <20170116132204.6421-4-kernel@kempniu.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Anthony Wong <anthony.wong@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

On Monday 16 January 2017 14:22:01 Michał Kępień wrote:
> With dell_app_wmi_led_set() replaced by dell_micmute_led_set(), rename
> the function pointer to the latter for consistency.
> 
> Signed-off-by: Michał Kępień <kernel@kempniu.pl>

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

-- 
Pali Rohár
pali.rohar@gmail.com
