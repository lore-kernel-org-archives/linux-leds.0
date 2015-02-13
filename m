From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 2/2] leds: add Qualcomm PM8941 WLED driver
Date: Thu, 12 Feb 2015 20:04:10 -0800
Message-ID: <54DD77BA.5020808@codeaurora.org>
References: <1422060853-1067-1-git-send-email-bjorn.andersson@sonymobile.com> <1422060853-1067-2-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1422060853-1067-2-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@linaro.org>
Cc: Courtney Cavin <courtney.cavin@sonymobile.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 01/23/15 16:54, Bjorn Andersson wrote:
> +
> +static int pm8941_wled_configure(struct pm8941_wled *wled, struct device *dev)
> +{
> +	struct pm8941_wled_config *cfg = &wled->cfg;
> +	u32 val;
> +	int rc;
> +	int i;
> +
> +	const struct {
> +		const char *name;
> +		u32 *val_ptr;
> +		const struct pm8941_wled_var_cfg *cfg;
> +	} u32_opts[] = {
> +		{
> +			"qcom,current-boost-limit",
> +			&cfg->i_boost_limit,
> +			.cfg = &pm8941_wled_i_boost_limit_cfg,
> +		},
> +		{
> +			"qcom,current-limit",
> +			&cfg->i_limit,
> +			.cfg = &pm8941_wled_i_limit_cfg,
> +		},
> +		{
> +			"qcom,ovp",
> +			&cfg->ovp,
> +			.cfg = &pm8941_wled_ovp_cfg,
> +		},
> +		{
> +			"qcom,switching-freq",
> +			&cfg->switch_freq,
> +			.cfg = &pm8941_wled_switch_freq_cfg,
> +		},
> +		{
> +			"qcom,num-strings",
> +			&cfg->num_strings,
> +			.cfg = &pm8941_wled_num_strings_cfg,
> +		},
> +	};
> +	const struct {
> +		const char *name;
> +		bool *val_ptr;
> +	} bool_opts[] = {
> +		{ "qcom,cs-out", &cfg->cs_out_en, },
> +		{ "qcom,ext-gen", &cfg->ext_gen, },
> +		{ "qcom,cabc", &cfg->cabc_en, },
> +	};
> +
> +	rc = of_property_read_u32(dev->of_node, "reg", &val);
> +	if (rc || val > 0xffff) {
> +		dev_err(dev, "invalid IO resources\n");
> +		return rc ? rc : -EINVAL;
> +	}
> +	wled->addr = val;
> +
> +	rc = of_property_read_string(dev->of_node, "label", &wled->cdev.name);
> +	if (rc)
> +		wled->cdev.name = dev->of_node->name;
> +
> +	wled->cdev.default_trigger = of_get_property(dev->of_node,
> +			"linux,default-trigger", NULL);
> +
> +	*cfg = pm8941_wled_config_defaults;
> +	for (i = 0; i < ARRAY_SIZE(u32_opts); ++i) {
> +		u32 sel, c;
> +		int j, rj;
> +
> +		rc = of_property_read_u32(dev->of_node, u32_opts[i].name, &val);
> +		if (rc) {
> +			if (rc != -EINVAL) {
> +				dev_err(dev, "error reading '%s'\n",
> +						u32_opts[i].name);
> +				return rc;
> +			}
> +			continue;
> +		}
> +
> +		sel = UINT_MAX;
> +		rj = -1;
> +		c = pm8941_wled_values(u32_opts[i].cfg, 0);
> +		for (j = 0; c != UINT_MAX; ++j) {
> +			if (c <= val && (sel == UINT_MAX || c >= sel)) {
> +				sel = c;
> +				rj = j;
> +			}
> +			c = pm8941_wled_values(u32_opts[i].cfg, j + 1);
> +		}
> +		if (sel == UINT_MAX) {
> +			dev_err(dev, "invalid value for '%s'\n",
> +					u32_opts[i].name);
> +			return rc;

Isn't rc always 0 here? Don't we want to return an error?

Also, I find this code very convoluted given that we loop through a
table and match based on nodes and call function pointers, etc. Why
can't we just have a handful of if statements with of_property_read_u32
in them? That way we don't have to jump through so many hoops, bouncing
all around this file to figure out what's going on. If we did I imagine
we wouldn't have missed out on rc being 0 here.

> +
> +static int pm8941_wled_remove(struct platform_device *pdev)
> +{
> +	struct pm8941_wled *wled;
> +
> +	wled = platform_get_drvdata(pdev);
> +	led_classdev_unregister(&wled->cdev);

Would be nice to have a devm for this one too.

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id pm8941_wled_match_table[] = {
> +	{ .compatible = "qcom,pm8941-wled" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, pm8941_wled_match_table);
> +
> +static struct platform_driver pm8941_wled_driver = {
> +	.probe	= pm8941_wled_probe,
> +	.remove = pm8941_wled_remove,
> +	.driver	= {
> +		.name		= "pm8941-wled",
> +		.owner		= THIS_MODULE,

THIS_MODULE should be removed.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
