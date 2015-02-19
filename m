From: Josh Cartwright <joshc@ni.com>
Subject: Re: [PATCH] led/led-class: Handle LEDs with the same name
Date: Thu, 19 Feb 2015 17:15:58 -0600
Message-ID: <20150219231558.GA30417@jcartwri.amer.corp.natinst.com>
References: <1423657572-22299-1-git-send-email-ricardo.ribalda@gmail.com>
 <CAK5ve-+98h+gzvcso_GmU+39mqhZgvaCnAgcBG0pzdZc1S406g@mail.gmail.com>
 <CAPybu_26e3evmHM3W7ZsUXin0LMWJWAbPSf8rFnDnLG821Jwpg@mail.gmail.com>
 <CAK5ve-Kuj5Z_Mwo7=-z4VPSmwEiv52YH2e=XCQ=7MvPiOErvJA@mail.gmail.com>
 <CAPybu_2e7P0O+x6Q37crg-T=y2vb05HuC3aE9NwPVjcP3TDQzA@mail.gmail.com>
 <CAK5ve-JbVX17SK9WBy4dT4g-CFJcPDjiwcUiSi=kssz7SJAsLA@mail.gmail.com>
 <CAPybu_3e3LRiyuUPzZkMQCsh3VtH8gB5Jhezyq7r4e9V113_XA@mail.gmail.com>
 <CAK5ve-KWrZL8wZ8UjEbe0cuBHoAxbRw_24wpVOiBd75rp-Jyuw@mail.gmail.com>
 <CAPybu_1hWj_LX_399tXxNWW-bD1bUhv2FESt5t0G5VH9HwS=SQ@mail.gmail.com>
 <CAK5ve-LNgZpUKhwe8jOPeipWDg7pv8ruQ9SSbjDmyUDDdbi04w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from skprod2.natinst.com ([130.164.80.23]:43676 "EHLO ni.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752621AbbBSXQL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 19 Feb 2015 18:16:11 -0500
In-Reply-To: <CAK5ve-LNgZpUKhwe8jOPeipWDg7pv8ruQ9SSbjDmyUDDdbi04w@mail.gmail.com>
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Rob Herring <robh+dt@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Tue, Feb 17, 2015 at 04:52:45PM -0800, Bryan Wu wrote:
> On Tue, Feb 17, 2015 at 4:32 PM, Ricardo Ribalda Delgado
[..]
> > Then we have TWO gpios chip. Each of them have a led named red. When
> > the second gpio-led is probed we have an error. Everything else
> > (address offset, phandle, device renaming) is handled properly already
> > by the kernel.
> >
> > On this system I cannot control card.dtb, or which type of cards will
> > the user connect to the system. The DT is generated in run-time based
> > on the hardware connected to the pci slots.
> >
> So you're supposed to get 2 card.dtb files for 2 PCI cards, right?
> They should be different and you need to choose different name for the
> hardware.

Is this solvable by adding support for led properties in an aliases { }
node?  I suppose that would mean you'd need to also overlay a selection
of which LED is "red", but I don't know if that is a problem.

  Josh
