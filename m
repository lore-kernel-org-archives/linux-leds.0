From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] Add LED pattern trigger
Date: Wed, 1 Jan 2014 20:11:31 +0000
Message-ID: <20140101201131.575a6337@alan.etchedpixels.co.uk>
References: <1388362275-1618-1-git-send-email-lgxue@hotmail.com>
	<20131230183302.GA28430@amd.pavel.ucw.cz>
	<BLU172-W18A7B97F4E688F416C5DABACC90@phx.gbl>
	<20131231113352.GA4233@amd.pavel.ucw.cz>
	<CAFLxGvy31K9cgiuQKPmcbbr8QpMmj3vxmA1opNWT01qDUaLR0Q@mail.gmail.com>
	<20131231190304.GA15451@amd.pavel.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131231190304.GA15451@amd.pavel.ucw.cz>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Weinberger <richard.weinberger@gmail.com>, Joe Xue <lgxue@hotmail.com>, "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

> > Why do we need this within the kernel?
> > Patterns can easily created using a simple user space program.
> 
> Some machines (N900) can do blinking in hardware, and we want
> consistent kernel-user interface. See the mailing list.

We have things called "libraries", see the mailing list.

Alan
