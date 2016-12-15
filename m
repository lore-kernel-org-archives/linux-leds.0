From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 4/7] dell-led: remove dell_app_wmi_led_set()
Date: Thu, 15 Dec 2016 15:48:16 +0100
Message-ID: <20161215144816.GC22695@kmp-mobile.hq.kempniu.pl>
References: <20161208123618.28603-1-kernel@kempniu.pl>
 <20161208123618.28603-5-kernel@kempniu.pl>
 <201612111140.48561@pali>
 <CAHp75VfTLrY_MBphzg2idGhQbvnjyf7+9-BQjD37TXnucj+nMw@mail.gmail.com>
 <CAHp75VcTSDOv4JK9Hr=GefWtOeYaQUFxTASwAeFJqM18BuU33w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VcTSDOv4JK9Hr=GefWtOeYaQUFxTASwAeFJqM18BuU33w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Louis Davis <Louis_Davis@dell.com>, Jim Dailey <Jim_Dailey@dell.com>, Alex Hung <alex.hung@canonical.com>, Hui Wang <hui.wang@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, ALSA Development Mailing List <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

> On Wed, Dec 14, 2016 at 3:54 AM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sun, Dec 11, 2016 at 12:40 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> >> On Thursday 08 December 2016 13:36:15 Michał Kępień wrote:
> >>> All calls to dell_app_wmi_led_set() have been replaced with direct
> >>> calls to dell_micmute_led_set(), so the former can be safely removed
> >>> along with its related enum.
> >>>
> >>> Signed-off-by: Michał Kępień <kernel@kempniu.pl>
> >>
> >> I would suggest to squash patches 2,3,4 into one. But I let decision to
> >> alsa & led maintainers.
> >
> > I don't like the part where we are exporting something for just one
> > moment.
> 
> Oops, misread function name, though still valid vote for one patch.

Thanks, I will do that in v2 (and thanks to Pali for suggesting it).

-- 
Best regards,
Michał Kępień
