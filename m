From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/6] dt: bindings: lp8860: Update DT label binding
Date: Wed, 20 Dec 2017 12:28:48 -0600
Message-ID: <20171220182848.xxqbhfdn6uu377pm@rob-hp-laptop>
References: <20171218202307.4913-1-dmurphy@ti.com>
 <20171218202307.4913-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:33705 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755292AbdLTS2u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 20 Dec 2017 13:28:50 -0500
Content-Disposition: inline
In-Reply-To: <20171218202307.4913-2-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On Mon, Dec 18, 2017 at 02:23:03PM -0600, Dan Murphy wrote:
> Update the lp8860 label binding to the LED
> standard as documented in
> 
> Documentation/devicetree/bindings/leds/common.txt
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v5 - Renamed label to just white:backlight - https://patchwork.kernel.org/patch/10108361
> Comment was made on patch 4 https://patchwork.kernel.org/patch/10108351/
> 
> v4 - No changes
> v3 - Added address and size cells, updated label with color and inserted spaces
> around the reg node - https://patchwork.kernel.org/patch/10093749/
> v2 - Added reg to child node and made it required
> 
>  Documentation/devicetree/bindings/leds/leds-lp8860.txt | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
