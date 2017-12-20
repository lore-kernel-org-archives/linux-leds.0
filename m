From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 4/6] dt: bindings: lp8860: Add trigger binding to the
 lp8860
Date: Wed, 20 Dec 2017 12:29:11 -0600
Message-ID: <20171220182911.ivsr6uzf5vq6clkh@rob-hp-laptop>
References: <20171218202307.4913-1-dmurphy@ti.com>
 <20171218202307.4913-4-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171218202307.4913-4-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, Dec 18, 2017 at 02:23:05PM -0600, Dan Murphy wrote:
> Add a default trigger optional node to the child node.
> This will allow the driver to set the trigger for a backlight.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v5 - No changes
> 
> v4 - No changes
> v3 - Removed optional and rebased - https://patchwork.kernel.org/patch/10093755/
> v2 - Moved binding changes to first patch in the series.
> 
>  Documentation/devicetree/bindings/leds/leds-lp8860.txt | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
