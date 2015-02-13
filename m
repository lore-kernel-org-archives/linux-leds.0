From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 2/2] leds: add Qualcomm PM8941 WLED driver
Date: Thu, 12 Feb 2015 20:26:13 -0800
Message-ID: <54DD7CE5.5000302@codeaurora.org>
References: <1422060853-1067-1-git-send-email-bjorn.andersson@sonymobile.com> <1422060853-1067-2-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422060853-1067-2-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@linaro.org>
Cc: Courtney Cavin <courtney.cavin@sonymobile.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 01/23/15 16:54, Bjorn Andersson wrote:
> +
> +static int pm8941_wled_set(struct led_classdev *cdev,
> +			   enum led_brightness value)
> +{
> +	struct pm8941_wled *wled;
> +	u8 ctrl = 0;
> +	u16 val;
> +	int rc;
> +	int i;
> +
> +	wled = container_of(cdev, struct pm8941_wled, cdev);
> +
> +	if (value != 0)
> +		ctrl = PM8941_WLED_REG_MOD_EN_BIT;
> +
> +	val = value * PM8941_WLED_REG_VAL_MAX / LED_FULL;
> +
> +	rc = regmap_update_bits(wled->regmap,
> +			wled->addr + PM8941_WLED_REG_MOD_EN,
> +			PM8941_WLED_REG_MOD_EN_MASK, ctrl);
> +	if (rc)
> +		return rc;
> +
> +	for (i = 0; i < wled->cfg.num_strings; ++i) {
> +		u8 v[2] = { val & 0xff, (val >> 8) & 0xf };
> +
> +		rc = regmap_bulk_write(wled->regmap,
> +				wled->addr + PM8941_WLED_REG_VAL_BASE + 2 * i,
> +				v, 2);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	rc = regmap_update_bits(wled->regmap,
> +			wled->addr + PM8941_WLED_REG_SYNC,
> +			PM8941_WLED_REG_SYNC_MASK, PM8941_WLED_REG_SYNC_ALL);
> +	if (rc)
> +		return rc;
> +
> +	rc = regmap_update_bits(wled->regmap,
> +			wled->addr + PM8941_WLED_REG_SYNC,
> +			PM8941_WLED_REG_SYNC_MASK, PM8941_WLED_REG_SYNC_CLEAR);
> +	return rc;
> +}

This doesn't seem to do anything for the OVP spike mentioned in this
patch[1]. Do you see that problem on your device? I imagine the PMIC is
the same.

[1]
https://www.codeaurora.org/cgit/quic/la/kernel/msm/commit/?id=fef9e15072562f0f28dc7066dcdd69388df81ed3

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
