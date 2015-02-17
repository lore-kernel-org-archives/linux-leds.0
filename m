From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] led/led-class: Handle LEDs with the same name
Date: Wed, 18 Feb 2015 00:47:18 +0100
Message-ID: <CAPybu_3e3LRiyuUPzZkMQCsh3VtH8gB5Jhezyq7r4e9V113_XA@mail.gmail.com>
References: <1423657572-22299-1-git-send-email-ricardo.ribalda@gmail.com>
 <CAK5ve-+98h+gzvcso_GmU+39mqhZgvaCnAgcBG0pzdZc1S406g@mail.gmail.com>
 <CAPybu_26e3evmHM3W7ZsUXin0LMWJWAbPSf8rFnDnLG821Jwpg@mail.gmail.com>
 <CAK5ve-Kuj5Z_Mwo7=-z4VPSmwEiv52YH2e=XCQ=7MvPiOErvJA@mail.gmail.com>
 <CAPybu_2e7P0O+x6Q37crg-T=y2vb05HuC3aE9NwPVjcP3TDQzA@mail.gmail.com> <CAK5ve-JbVX17SK9WBy4dT4g-CFJcPDjiwcUiSi=kssz7SJAsLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK5ve-JbVX17SK9WBy4dT4g-CFJcPDjiwcUiSi=kssz7SJAsLA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi

On Wed, Feb 18, 2015 at 12:35 AM, Bryan Wu <cooloney@gmail.com> wrote:

> So why not use name "red0" and name another one "red1"? since you have
> multiple different red leds here any way.

I cannot control how many cameras the user will decide to attach to
the system, and if two similar cameras are attached to pciA and pciB,
they would try to load the same dt.

So I would have to parse the device tree on-line, finding the leds,
renaming them... and that code would be duplicated for every driver
doing similar work.  Not only that, I would have to avoid collisions
to my "cameras", also to other devices that may have decided to use
similar naming.

I think the proposed solution is more simple, and solves the issue of
duplicated led names around the whole system. Also, if there is no
duplicated names it follows the old behaviours.

Thanks!

>
> -Bryan
>> --
>> Ricardo Ribalda



-- 
Ricardo Ribalda
