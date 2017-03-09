From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: BCM5301X: Don't use nonexistent
 "default-off" LED trigger
Date: Thu, 9 Mar 2017 12:33:46 -0800
Message-ID: <b0dc618c-5fd3-e2a0-570d-bbd901a2d137@gmail.com>
References: <20170308064105.26619-1-zajec5@gmail.com>
 <20170308064105.26619-2-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:32930 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751037AbdCIUdu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Mar 2017 15:33:50 -0500
In-Reply-To: <20170308064105.26619-2-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>

On 03/07/2017 10:41 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Such a trigger doesn't exist in Linux and is not needed as LED is being
> turned off by default. This could cause errors in LEDs core code when
> trying to set default trigger.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Applied, thanks!
-- 
Florian
