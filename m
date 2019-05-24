From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [RESEND PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274 LED
 driver
Date: Fri, 24 May 2019 22:51:09 +0200
Message-ID: <89a80aa8-66ee-d0ec-fa54-c55ca8de06af@gmail.com>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-7-dmurphy@ti.com> <20190523125012.GB20354@amd>
 <0c2bd6af-92c5-2458-dc41-1ea413545347@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0c2bd6af-92c5-2458-dc41-1ea413545347@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>
Cc: broonie@kernel.org, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 5/23/19 9:09 PM, Dan Murphy wrote:
> Pavel
> 
> Thanks for the review
> 
> On 5/23/19 7:50 AM, Pavel Machek wrote:
>> Hi!
>>
>>> +++ b/drivers/leds/leds-lm36274.c
>>
>>> +static int lm36274_parse_dt(struct lm36274 *lm36274_data)
>>> +{
>>> +	struct fwnode_handle *child = NULL;
>>> +	char label[LED_MAX_NAME_SIZE];
>>> +	struct device *dev = &lm36274_data->pdev->dev;
>>> +	const char *name;
>>> +	int child_cnt;
>>> +	int ret = -EINVAL;
>>> +
>>> +	/* There should only be 1 node */
>>> +	child_cnt = device_get_child_node_count(dev);
>>> +	if (child_cnt != 1)
>>> +		return ret;
>>
>> I'd do explicit "return -EINVAL" here.
>>
> 
> ACK
> 
>>> +static int lm36274_probe(struct platform_device *pdev)
>>> +{
>>> +	struct ti_lmu *lmu = dev_get_drvdata(pdev->dev.parent);
>>> +	struct lm36274 *lm36274_data;
>>> +	int ret;
>>> +
>>> +	lm36274_data = devm_kzalloc(&pdev->dev, sizeof(*lm36274_data),
>>> +				    GFP_KERNEL);
>>> +	if (!lm36274_data) {
>>> +		ret = -ENOMEM;
>>> +		return ret;
>>> +	}
>>
>> And certainly do "return -ENOMEM" explicitly here.
>>
> 
> ACK
> 
>> Acked-by: Pavel Machek <pavel@ucw.cz>

I've done all amendments requested by Pavel and updated branch
ib-leds-mfd-regulator on linux-leds.git, but in the same time
dropped the merge from the for-next.

We will proceed further once we clarify the issue of cross-merging
recently raised again by Linus.

-- 
Best regards,
Jacek Anaszewski
