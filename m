From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/6] Introduce audio-mute LED trigger (and
	conversions to it)
Date: Wed, 28 Nov 2018 15:40:18 +0200
Message-ID: <CAHp75VeY3xe8gjRPPHO-McqjB4e2aNh8kXwQ3N6weyeKh8CmRQ@mail.gmail.com>
References: <20181126171126.20280-1-tiwai@suse.de> <20181127084418.GA20504@amd>
 <20181128111806.cb3cncpjeq73sptg@pali> <s5hy39dv3dg.wl-tiwai@suse.de>
 <20181128122505.GA1193@amd> <s5hr2f5uzo0.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <s5hr2f5uzo0.wl-tiwai@suse.de>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Takashi Iwai <tiwai@suse.de>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Hui Wang <hui.wang@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Wed, Nov 28, 2018 at 2:59 PM Takashi Iwai <tiwai@suse.de> wrote:
> On Wed, 28 Nov 2018 13:25:05 +0100,
> > On Wed 2018-11-28 12:38:19, Takashi Iwai wrote:

> > Just use sys:: :-).
> >
> > laptop:: would work for me, too. (It is always laptop in the cases we
> > are handling now, right?)
>
> In theory, such a thing can be on all-in-one desktops, too.
>
> > When we get a keyboard with mute led, we'll have to decide if it
> > should be input6::mute -- because it is on keyboard, or if it is
> > sys::mute -- because the key is expected to mute whole system.
>
> OK, I'll wait for more comments in today and update accordingly.

sys sounds plausible to me. In any case we may revisit in the future
if something happens to it. OTOH it would be part of ABI, right?

-- 
With Best Regards,
Andy Shevchenko
