From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 7/7] leds: lp50xx: Add the LP50XX family of the RGB LED
 driver
Date: Thu, 11 Apr 2019 15:53:33 -0500
Message-ID: <15ab56e5-8497-a287-3d83-a8f94be99235@ti.com>
References: <20190411193848.23140-1-dmurphy@ti.com>
 <20190411193848.23140-8-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411193848.23140-8-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, marek.behun@nic.cz, rdunlap@infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hello

On 4/11/19 2:38 PM, Dan Murphy wrote:
> Introduce the LP5036/30/24/18 RGB LED driver.
> The difference in these parts are the number of
> LED outputs where the:
> 
> LP5036 can control 36 LEDs
> LP5030 can control 30 LEDs
> LP5024 can control 24 LEDs
> LP5018 can control 18 LEDs
> 
> The device has the ability to group LED output into control banks
> so that multiple LED banks can be controlled with the same mixing and
> brightness.  Inversely the LEDs can also be controlled independently.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  Documentation/leds/leds-lp50xx.txt |  36 ++

This document needs to be removed or updated as it is not correct.

Dan
<snip>
