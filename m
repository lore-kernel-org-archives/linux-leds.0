From: Lee Jones <lee.jones@linaro.org>
Subject: Re: cross-merges with MFD tree (was: Re: GFS2: Pull Request)
Date: Wed, 29 May 2019 12:40:38 +0100
Message-ID: <20190529114038.GI4574@dell>
References: <CAHc6FU5Yd9EVju+kY8228n-Ccm7F2ZBRJUbesT-HYsy2YjKc_w@mail.gmail.com>
 <CAHk-=wj_L9d8P0Kmtb5f4wudm=KGZ5z0ijJ-NxTY-CcNcNDP5A@mail.gmail.com>
 <61f6987a-5502-f119-6595-fc6badb864fb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <61f6987a-5502-f119-6595-fc6badb864fb@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: linux-leds@vger.kernel.org

On Tue, 28 May 2019, Jacek Anaszewski wrote:

> Hi Linus,
> 
> On 5/8/19 7:55 PM, Linus Torvalds wrote:
> > On Wed, May 8, 2019 at 4:49 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> > > 
> > > There was a conflict with commit 2b070cfe582b ("block: remove the i
> > > argument to bio_for_each_segment_all") on Jens's block layer changes
> > > which you've already merged. I've resolved that by merging those block
> > > layer changes; please let me know if you want this done differently.
> > 
> > PLEASE.
> > 
> > I say this to somebody pretty much every single merge window: don't do
> > merges for me.
> > 
> > You are actually just hurting, not helping. I want to know what the
> > conflicts are, not by being told after-the-fact, but by just seeing
> > them and resolving them.
> > 
> > Yes, I like being _warned_ ahead of time - partly just as a heads up
> > to me, but partly also to show that the maintainers are aware of the
> > notifications from linux-next, and that linux-next is working as
> > intended, and people aren't just ignoring what it reports.
> > 
> > But I do *NOT* want to see maintainers cross-merging each others trees.
> 
> I would like to clarify if this applies to immutable integration
> branches that are usually created for MFD subsystem. That subsystem
> is somehow specific since changes made to MFD drivers are often a part
> of bigger patch sets that add drivers of MFD cells to the other
> subsystems.
> 
> Like in my area of interest an addition of a driver for LED cell
> of MFD device must be followed by addition of a corresponding entry to
> struct mfd_cell array in the related MFD driver.
> 
> And sometimes even another subsystem is involved, like e.g. regulator
> framework in case of recent extension of ti-lmu driver.
> 
> So far you haven't complained about this specific workflow, but I'd like
> to make sure how you see it.

After you bought this conversation to my attention last week, I took
the initiative and spoke to a few senior maintainers (Mark Brown,
Linus Walleij, etc) for their views.  I choose these guys because they
are commonly on the receiving end of my Pull Requests when we need to
do this.

Due to its inherent nature, MFD usually finds itself interacting with
other subsystems in ways which deal with both physical merge conflicts
and build dependencies.  For some time now the vast majority of the
other maintainers I work with and I have believed, and still do, that
the best way to mitigate these issues is to produce small, succinct,
immutable topic branches.  These branches only usually contain a few 
patches and serve to solve a specific potential issue - usually
build-time problems, but also have the added bonus of preventing merge
conflicts and keeping us out of the forefront of Linus' mind (and out
of trouble!)

We've been doing this for some time and have interacted with many
subsystems (ACPI, ASoC, ARM-SoC, Clocksource, Excon, GPIO, Hwmon, I2C,
IIO, Input, IRQChip, LED, PWM, Media, Net, Pinctrl, Platform, Power,
Regulator, RTC, USB, Video, Watchdog, etc, etc) over the years [0].

In my mind, small, immutable topic branches is still the cleanest way
to deal with the issues facing MFD currently.  And is not what Linus
is detailing in his recent mail(s) on the subject.  We are not "doing
merges on his behalf", we are ensuring; buildable, bisectable,
error-free branches/history that will also merge cleanly.

[0] `git log --oneline --grep ib-mfd mainline/master`

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
