From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 3/8] backlight: qcom-wled: Add new properties for
 PMI8998
Date: Wed, 11 Jul 2018 09:12:36 -0600
Message-ID: <20180711151236.GA646@rob-hp-laptop>
References: <1531131741-19971-1-git-send-email-kgunda@codeaurora.org>
 <1531131741-19971-4-git-send-email-kgunda@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531131741-19971-4-git-send-email-kgunda@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kiran Gunda <kgunda@codeaurora.org>
Cc: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, Jul 09, 2018 at 03:52:16PM +0530, Kiran Gunda wrote:
> Update the bindings with the new properties used for
> PMI8998.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
> Changes from V3:
> 	- Removed the default values.
> 	- Removed pmi8998 example.
> 
>  .../bindings/leds/backlight/qcom-wled.txt          | 76 ++++++++++++++++++----
>  1 file changed, 62 insertions(+), 14 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
