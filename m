From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/4] mfd: ti-lmu: Remove LM3532 backlight driver
 references
Date: Wed, 3 Apr 2019 08:57:09 +0100
Message-ID: <20190403075709.GD11301@dell>
References: <20190321142838.22985-1-dmurphy@ti.com>
 <20190321142838.22985-3-dmurphy@ti.com>
 <8769a95d-179f-6219-0a63-9dd623cdd297@gmail.com>
 <20190325075317.GW4731@dell>
 <c950b7d3-eeb1-2dc2-b732-3a40d5b3a8b7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c950b7d3-eeb1-2dc2-b732-3a40d5b3a8b7@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, pavel@ucw.cz, tony@atomide.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, 25 Mar 2019, Jacek Anaszewski wrote:

> On 3/25/19 8:53 AM, Lee Jones wrote:
> > On Sat, 23 Mar 2019, Jacek Anaszewski wrote:
> > 
> > > Hi Lee,
> > > 
> > > Can we have your ack for this going via LED tree, please?
> > 
> > Patch looks okay.
> > 
> > You can take it through the LED, but if you do I will need you to send
> > me a pull-request to a minimised immutable branch please.
> > 
> > If you cannot do this, I can apply the set and provide the same to
> > you.
> > 
> > If you choose the former:
> > 
> >    Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> > 
> > Please let me know what you decide
> > 
> 
> I've been exposing integration branches in the past, but after Linus'
> message [0] I have my doubts now. I wonder if it wouldn't make more
> sense if I just took the patches, and you'd cherry-pick them only in
> case such a need occurs. This way we would avoid this whole merge
> noise, which in an optimistic and very plausible case will not be needed
> at all.
> 
> [0] https://lkml.org/lkml/2017/4/19/1104

That email is 2 years old, and does not seem relevant to what we're
trying to achieve.  I've only ever had issues when *not* creating
immutable branches for these, cross subsystem scenarios.  The
shared branches I create are always minimalist and never change.

I'm happy to take the patches and create a suitable pull-request for
you if you are uncomfortable with the process.  I just need your Ack
to do so.  Up to you.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
