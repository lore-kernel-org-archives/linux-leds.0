From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/9] dt-bindings: leds: Add multicolor ID to the color
 ID  list
Date: Fri, 14 Jun 2019 11:00:34 -0600
Message-ID: <20190614170034.GA7789@bogus>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-5-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190523190820.29375-5-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

On Thu, 23 May 2019 14:08:15 -0500, Dan Murphy wrote:
> Add a new color ID that is declared as MULTICOLOR as with the
> multicolor framework declaring a definitive color is not accurate
> as the node can contain multiple colors.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  include/dt-bindings/leds/common.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
