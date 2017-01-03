From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/5] devicetree: mfd: Add binding for the TI LM3533
Date: Tue, 3 Jan 2017 10:56:48 -0600
Message-ID: <20170103165648.wotwuihc5i4tscp5@rob-hp-laptop>
References: <20161226181153.11271-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161226181153.11271-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee.jones@linaro.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-leds@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: linux-leds@vger.kernel.org

On Mon, Dec 26, 2016 at 10:11:49AM -0800, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> 
> Add the binding for the Texas Instruments LM3533 lighting power
> solution.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> I had Acks from Jonathan and Rob on v3, but dropped these due to the added
> compatible properties.
> 
> Changes since v3:
> - Added compatible to sub-nodes, per Lee's requested to treat them as separate
>   pieces.

Acked-by: Rob Herring <robh@kernel.org>
