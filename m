From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH v6 3/3] leds/powernv: Add driver for PowerNV platform
Date: Mon, 20 Jul 2015 22:25:37 +0530
Message-ID: <55AD2809.6050007@linux.vnet.ibm.com>
References: <1437129671-14078-1-git-send-email-hegdevasant@linux.vnet.ibm.com> <1437129671-14078-4-git-send-email-hegdevasant@linux.vnet.ibm.com> <55A91E67.6010200@samsung.com> <55A92B44.6020502@linux.vnet.ibm.com> <55AC193B.9060005@gmail.com> <55AC9244.5010407@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e23smtp07.au.ibm.com ([202.81.31.140]:34441 "EHLO
	e23smtp07.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752261AbbGTQ4g (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 20 Jul 2015 12:56:36 -0400
Received: from /spool/local
	by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Tue, 21 Jul 2015 02:56:34 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id 7CC393578048
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2015 02:56:30 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t6KGuMxw59244718
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2015 02:56:30 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t6KGtvTY008169
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2015 02:55:58 +1000
In-Reply-To: <55AC9244.5010407@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, stewart@linux.vnet.ibm.com, arnd@arndb.de, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com, mpe@ellerman.id.au, benh@kernel.crashing.org

On 07/20/2015 11:46 AM, Jacek Anaszewski wrote:
> On 19.07.2015 23:40, Jacek Anaszewski wrote:
> [...]
>>>>> +/* Platform driver probe */
>>>>> +static int powernv_led_probe(struct platform_device *pdev)
>>>>> +{
>>>>> +    int num_leds;
>>>>> +    struct device_node *led_node;
>>>>> +    struct powernv_leds_priv *priv;
>>>>> +
>>>>> +    led_node = of_find_node_by_path("/ibm,opal/leds");
>>>>> +    if (!led_node) {
>>>>> +        dev_err(&pdev->dev,
>>>>> +            "%s: LED parent device node not found\n", __func__);
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +
>>>>> +    num_leds = powernv_leds_count(led_node);
>>>>> +    if (num_leds <= 0) {
>>>>> +        dev_err(&pdev->dev,
>>>>> +            "%s: No location code found under LED node\n",
>>>>> +            __func__);
>>>>> +        return -EINVAL;
>>>>> +    }
>>
>> You won't need to count the number of LEDs to register, just allocate
>> memory for each LED during parsing with managed resource allocation
>> API.

Jacek,

> 
> You can refer to drivers/leds/leds-bcm6328.c in order to gain
> full picture on how this can look like.
> struct powernv_led_data would have to carry the pointer to the
> new common struct.
> 

Sure.. Will though this code and will fix powernv code..

Thanks
-Vasant
