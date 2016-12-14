From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 4/7] dell-led: remove dell_app_wmi_led_set()
Date: Wed, 14 Dec 2016 03:57:48 +0200
Message-ID: <CAHp75VcTSDOv4JK9Hr=GefWtOeYaQUFxTASwAeFJqM18BuU33w@mail.gmail.com>
References: <20161208123618.28603-1-kernel@kempniu.pl> <20161208123618.28603-5-kernel@kempniu.pl>
 <201612111140.48561@pali> <CAHp75VfTLrY_MBphzg2idGhQbvnjyf7+9-BQjD37TXnucj+nMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfTLrY_MBphzg2idGhQbvnjyf7+9-BQjD37TXnucj+nMw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Louis Davis <Louis_Davis@dell.com>, Jim Dailey <Jim_Dailey@dell.com>, Alex Hung <alex.hung@canonical.com>, Hui Wang <hui.wang@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, ALSA Development Mailing List <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Wed, Dec 14, 2016 at 3:54 AM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sun, Dec 11, 2016 at 12:40 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> =
wrote:
>> On Thursday 08 December 2016 13:36:15 Micha=C5=82 K=C4=99pie=C5=84 wrote=
:
>>> All calls to dell_app_wmi_led_set() have been replaced with direct
>>> calls to dell_micmute_led_set(), so the former can be safely removed
>>> along with its related enum.
>>>
>>> Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
>>
>> I would suggest to squash patches 2,3,4 into one. But I let decision to
>> alsa & led maintainers.
>
> I don't like the part where we are exporting something for just one
> moment.

Oops, misread function name, though still valid vote for one patch.

> So, +1 to squashed version.
>
>>
>> Anyway, for patches 2,3,4 you can add my Reviewed-by. It is nice cleanup
>>
>> Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>


--=20
With Best Regards,
Andy Shevchenko
