From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: LED devices & poll() for brightness attribute
Date: Fri, 24 Feb 2017 09:58:14 +0100
Message-ID: <20170224085814.GB2157@pali>
References: <20170222090630.GB21558@pali>
 <20170223144852.GD24201@pali>
 <20170223202333.GA19376@amd>
 <201702232144.54558@pali>
 <20170223210321.GB19376@amd>
 <20170224085055.GA2157@pali>
 <e87ee6f8-8c7e-7370-33ae-6f420f91a582@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e87ee6f8-8c7e-7370-33ae-6f420f91a582@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Friday 24 February 2017 09:52:11 Hans de Goede wrote:
> Hi,
> 
> On 24-02-17 09:50, Pali Rohár wrote:
> >On Thursday 23 February 2017 22:03:21 Pavel Machek wrote:
> >>So, if you seriously want to do this, can you
> >>
> >>1) write specification explaining how desktops should poll() the
> >>brightness files
> >>
> >>2) get someone to volunteer to implement that specification for at
> >>least GNOME and KDE?
> >
> >Hm... Probably I should try to implement it myself :-) and look deeply
> >what I'm proposing...
> >
> >Hans, you probably already did some changes for hw brightness changed
> >attribute... Do you have some links or application parts which handle
> >this for GNOME, KDE or other DE? So I could look at correct application?
> >
> >IIRC KDE4 uses upowerd for controlling keyboard backlight.
> 
> Gnome uses upower too, and current upower master has patches to
> support brightness_hw_changed which you could use as a start.

Ok, thanks!

-- 
Pali Rohár
pali.rohar@gmail.com
