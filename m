From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 3/4] leds: core: add documentation for color extension
Date: Tue, 01 Mar 2016 21:41:37 +0000
Message-ID: <20160301214135.GA21265@kroah.com>
References: <56D609BB.1010804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail177-1.suw61.mandrillapp.com ([198.2.177.1]:32204 "EHLO
	mail177-1.suw61.mandrillapp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752317AbcCAVli (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 1 Mar 2016 16:41:38 -0500
Received: from pmta06.mandrill.prod.suw01.rsglab.com (127.0.0.1) by mail177-1.suw61.mandrillapp.com id hqo69422rtka for <linux-leds@vger.kernel.org>; Tue, 1 Mar 2016 21:41:37 +0000 (envelope-from <bounce-md_30481620.56d60c91.v1-39e8433d302d48e495c1a01f5c8ee589@mandrillapp.com>)
In-Reply-To: <56D609BB.1010804@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 01, 2016 at 10:29:31PM +0100, Heiner Kallweit wrote:
> Document the color extension in Documentation/leds/leds-class.txt
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - introduced to patch series
> v3:
> - document extension in more detail
> v4:
> - Better explain why flag LED_SET_HUE_SAT is needed
> v5:
> - no changes
> ---
>  Documentation/leds/leds-class.txt | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)

What aboud Documentation/ABI/ ?
