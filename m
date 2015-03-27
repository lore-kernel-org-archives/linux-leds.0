From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH v3] led/led-class: Handle LEDs with the same name
Date: Fri, 27 Mar 2015 09:09:13 +0100
Message-ID: <CAPybu_1thjCfz3Xomzpvc3Hpw2j_z8rXpmp28WnuRBDE0DYAtA@mail.gmail.com>
References: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com> <20150326233025.GR18321@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150326233025.GR18321@valkosipuli.retiisi.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christopher Li <sparse@chrisli.org>
List-Id: linux-leds@vger.kernel.org

Hi Sakari

cc: adding Greg (core and FormatGuard) and Chistopher (sparse)
>
> I just realised there was another issue --- the name is now interpreted as
> format string. Bad things will happen if there's e.g. %s in the name itself
> --- perhaps unlikely, but possible.

Good catch!

Would it be possible to add a sparse check to avoid this in all the kernel?

And what about a macro protection like FormatGuard?

https://www.usenix.org/legacy/events/sec01/full_papers/cowanbarringer/cowanbarringer.pdf


Thanks!

-- 
Ricardo Ribalda
