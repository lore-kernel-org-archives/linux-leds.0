From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH] ledtrig-cpu: Handle CPU hot(un)plugging
Date: Thu, 06 Feb 2014 17:06:56 +0000
Message-ID: <1391706416.22943.2.camel@hornet>
References: <1390408322-1284-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fw-tnat.austin.arm.com ([217.140.110.23]:23222 "EHLO
	collaborate-mta1.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751711AbaBFRG5 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 6 Feb 2014 12:06:57 -0500
In-Reply-To: <1390408322-1284-1-git-send-email-pawel.moll@arm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Wed, 2014-01-22 at 16:32 +0000, Pawel Moll wrote:
> When CPU is hot(un)plugged, no syscore notification is being
> generated, nor is cpuidle involved. This leaves the CPU LED
> turned on, because the dying thread is doing some work (LED on)
> and than it is... well, dying (LED still on :-)
> 
> Added notifier block for hot(un)plugging operations, generating
> existing trigger events.
> 
> Signed-off-by: Pawel Moll <pawel.moll@arm.com>

This is just a friendly and polite ping :-)

Pawel
