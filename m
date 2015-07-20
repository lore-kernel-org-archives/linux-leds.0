From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v6 3/3] leds/powernv: Add driver for PowerNV platform
Date: Mon, 20 Jul 2015 08:16:36 +0200
Message-ID: <55AC9244.5010407@gmail.com>
References: <1437129671-14078-1-git-send-email-hegdevasant@linux.vnet.ibm.com> <1437129671-14078-4-git-send-email-hegdevasant@linux.vnet.ibm.com> <55A91E67.6010200@samsung.com> <55A92B44.6020502@linux.vnet.ibm.com> <55AC193B.9060005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wg0-f66.google.com ([74.125.82.66]:35125 "EHLO
	mail-wg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752837AbbGTGSH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 20 Jul 2015 02:18:07 -0400
Received: by wgkl9 with SMTP id l9so12255182wgk.2
        for <linux-leds@vger.kernel.org>; Sun, 19 Jul 2015 23:18:05 -0700 (PDT)
In-Reply-To: <55AC193B.9060005@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, stewart@linux.vnet.ibm.com, arnd@arndb.de, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com, mpe@ellerman.id.au, benh@kernel.crashing.org

On 19.07.2015 23:40, Jacek Anaszewski wrote:
[...]
>>>> +/* Platform driver probe */
>>>> +static int powernv_led_probe(struct platform_device *pdev)
>>>> +{
>>>> +    int num_leds;
>>>> +    struct device_node *led_node;
>>>> +    struct powernv_leds_priv *priv;
>>>> +
>>>> +    led_node = of_find_node_by_path("/ibm,opal/leds");
>>>> +    if (!led_node) {
>>>> +        dev_err(&pdev->dev,
>>>> +            "%s: LED parent device node not found\n", __func__);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    num_leds = powernv_leds_count(led_node);
>>>> +    if (num_leds <= 0) {
>>>> +        dev_err(&pdev->dev,
>>>> +            "%s: No location code found under LED node\n",
>>>> +            __func__);
>>>> +        return -EINVAL;
>>>> +    }
>
> You won't need to count the number of LEDs to register, just allocate
> memory for each LED during parsing with managed resource allocation
> API.

You can refer to drivers/leds/leds-bcm6328.c in order to gain
full picture on how this can look like.
struct powernv_led_data would have to carry the pointer to the
new common struct.

-- 
Best Regards,
Jacek Anaszewski
