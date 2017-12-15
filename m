From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v4 4/6] dt: bindings: lp8860: Add trigger binding to the
 lp8860
Date: Fri, 15 Dec 2017 11:22:24 -0600
Message-ID: <76329432-f96e-93ab-ed9b-ade22c8735c9@ti.com>
References: <20171212220143.31210-1-dmurphy@ti.com>
 <20171212220143.31210-5-dmurphy@ti.com> <20171215090903.GC8221@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:35358 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755428AbdLORWp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 15 Dec 2017 12:22:45 -0500
In-Reply-To: <20171215090903.GC8221@amd>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Pavel

On 12/15/2017 03:09 AM, Pavel Machek wrote:
> Hi!
> 
>> @@ -35,6 +37,7 @@ led-controller@2d {
>>  	led@0 {
>>  		reg = <0>;
>>  		label = "white:display_cluster";
>> +		linux,default-trigger = "backlight";
>>  	};
>>  }
> 
> What is "display_cluster"? Is it display backlight?
> 

This device can be configured to drive all 4 LED strings in display mode
so that all 4 strings have the same brightness controlled either through PWM or
through the brightness register 

or

As cluster string where the brightness of individual strings or clustered strings
can be controlled via independent brightness control registers.  I am currently working
on adding this support to the driver.

Dan

> Could we use ":backlight" and perhaps start documentation file listing
> "common" LED descriptions so they are shared across machines?
> 
> For the record, I'd prefer this to be
> "/sys/class/leds/display:white:backlight" in the end... so that we
> have nice naming for userspace, consistent between different machines.
> 
> 									Pavel
> 


-- 
------------------
Dan Murphy
