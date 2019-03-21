From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 1/4] dt: lm3532: Add lm3532 dt doc and update ti_lmu doc
Date: Thu, 21 Mar 2019 09:30:08 -0500
Message-ID: <8534f562-a7d1-cae5-c944-966f9d4a8089@ti.com>
References: <20190321142838.22985-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321142838.22985-1-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, tony@atomide.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

All

On 3/21/19 9:28 AM, Dan Murphy wrote:
> Add the lm3532 device tree documentation.
> Remove lm3532 device tree reference from the ti_lmu devicetree
> documentation.
> 
> With the addition of the dedicated lm3532 documentation the device
> can be removed from the ti_lmu.txt.
> 
> The reason for this is that the lm3532 dt documentation now defines
> the ability to control LED output strings against different control
> banks or groups multiple strings to be controlled by a single control
> bank.
> 
> Another addition was for ALS lighting control and configuration.  The
> LM3532 has a feature that can take in the ALS reading from 2 separate
> ALS devices and adjust the brightness on the strings that are configured
> to support this feature.
> 
> Finally the device specific properties were moved to the parent node as these
> properties are not control bank configurable.  These include the runtime ramp
> and the ALS configuration.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v5 - Moved ramping range to below property definition, updated keyboard label -
> https://lore.kernel.org/patchwork/patch/1050412/
> 
<snip>

I missed the v5 in $subject

But this patch set is v5

Dan
-- 
------------------
Dan Murphy
