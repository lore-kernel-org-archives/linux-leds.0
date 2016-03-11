From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v7 1/5] leds: core: add generic support for RGB LED's
Date: Fri, 11 Mar 2016 18:59:42 +0100
Message-ID: <56E3078E.5040102@gmail.com>
References: <56D9F973.8090207@gmail.com> <56E2841D.7020402@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33728 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750705AbcCKSAx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 11 Mar 2016 13:00:53 -0500
In-Reply-To: <56E2841D.7020402@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Karl Palsson <karlp@tweak.net.au>

Am 11.03.2016 um 09:38 schrieb Jacek Anaszewski:
> Hi Heiner,
> 
> Thanks for the updated set. I've renamed the feature to RGB LED class
> and pushed out to devel branch of linux-leds.git. It will sit there
> till the end of the upcoming merge window. There have been some
> uncertainties raised related to overloading brightness syntax. so let's
> better have it in linux-next through the whole next development cycle
> for the people to comment on.

Thanks Jacek, fine with me. I think in the next days I can come up with
two or three follow-up patches using this RGB LED functionality in triggers.
They would also be candidates for the devel branch then.

Rgds, Heiner

> 
> Thanks,
> Jacek Anaszewski
> 
> [...]
