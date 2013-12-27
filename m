From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] Add the LED burst trigger
Date: Fri, 27 Dec 2013 11:57:46 +0000
Message-ID: <20131227115746.4cbd9523@alan.etchedpixels.co.uk>
References: <1387895407-28031-1-git-send-email-lgxue@hotmail.com>
	<20131225230935.GB13593@amd.pavel.ucw.cz>
	<BLU172-W52032BFEF4512123D7516EACC20@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:55287 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754452Ab3L0L6N (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Dec 2013 06:58:13 -0500
In-Reply-To: <BLU172-W52032BFEF4512123D7516EACC20@phx.gbl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Joe Xue <lgxue@hotmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>

On Wed, 25 Dec 2013 20:02:33 -0500
Joe Xue <lgxue@hotmail.com> wrote:

> Hi,
> 
> Yes, Morse code can indicate any means. But when we look at the LEDs, would we like to also have a Morse code book in hand?
> 
> The burst led blink idea is because it is easy to use and easy to describe. Mostly when users on site are describing the LEDs states to the support engineer.

Sure but 
- Why bother putting it into the kernel when you can do it in user space
- Why use morse code when you are probably better using something that
  can be decoded in software off a phone video and so has FEC (viterbi or
  similar) on it ?
