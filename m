From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/6] dt: bindings: lp8860: Update bindings for lp8860
Date: Fri, 15 Dec 2017 16:56:43 -0600
Message-ID: <20171215225643.areokv4hpa2r5wkl@rob-hp-laptop>
References: <20171212220143.31210-1-dmurphy@ti.com>
 <20171212220143.31210-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:40797 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755824AbdLOW4p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 15 Dec 2017 17:56:45 -0500
Content-Disposition: inline
In-Reply-To: <20171212220143.31210-2-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On Tue, Dec 12, 2017 at 04:01:38PM -0600, Dan Murphy wrote:
> Update the lp8860 bindings to fix various issues
> found.  Add address-cells and size-cells, rename
> enable-gpio to enable-gpios, update the node name
> to the device name and indent the node example.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v4 - No changes
> 
> v3 - Indicatd enable-gpios is active high, moved address and size cells to child
> node patch and updated parent DT node name - https://patchwork.kernel.org/patch/10093745/
> v2 - New patch
> 
>  Documentation/devicetree/bindings/leds/leds-lp8860.txt | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
