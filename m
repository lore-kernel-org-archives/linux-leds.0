Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD32EB64DA
	for <linux-leds@archiver.kernel.org>; Thu, 22 Jun 2023 17:49:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjFVRte (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 22 Jun 2023 13:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbjFVRtX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 22 Jun 2023 13:49:23 -0400
Received: from 9.mo563.mail-out.ovh.net (9.mo563.mail-out.ovh.net [46.105.73.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7F7268B
        for <linux-leds@vger.kernel.org>; Thu, 22 Jun 2023 10:49:15 -0700 (PDT)
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net [79.137.60.37])
        by mo563.mail-out.ovh.net (Postfix) with ESMTPS id 32F02239B6;
        Thu, 22 Jun 2023 17:49:13 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net. [127.0.0.1])
        by director4.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <conor+dt@kernel.org>; Thu, 22 Jun 2023 17:49:13 +0000 (UTC)
Received: from pro2.mail.ovh.net (unknown [10.108.20.246])
        by director4.derp.mail-out.ovh.net (Postfix) with ESMTPS id 1D0591FE6D;
        Thu, 22 Jun 2023 17:49:13 +0000 (UTC)
Received: from [192.168.1.41] (88.161.25.233) by DAG1EX1.emp2.local
 (172.16.2.1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 22 Jun
 2023 19:49:12 +0200
Message-ID: <e9d23080-3916-f8ff-e179-4572d02c57b0@traphandler.com>
Date:   Thu, 22 Jun 2023 19:49:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v9 5/5] leds: Add a multicolor LED driver to group
 monochromatic LEDs
To:     Lee Jones <lee@kernel.org>
CC:     <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20230616095746.872220-1-jjhiblot@traphandler.com>
 <20230616095746.872220-6-jjhiblot@traphandler.com>
 <20230621193321.GU10378@google.com>
Content-Language: en-US
From:   Jean-Jacques Hiblot <jjhiblot@traphandler.com>
In-Reply-To: <20230621193321.GU10378@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [88.161.25.233]
X-ClientProxiedBy: DAG3EX1.emp2.local (172.16.2.21) To DAG1EX1.emp2.local
 (172.16.2.1)
X-Ovh-Tracer-Id: 9914956058122861019
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeguddgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomheplfgvrghnqdflrggtqhhuvghsucfjihgslhhothcuoehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomheqnecuggftrfgrthhtvghrnhepieejfedukeevudfghfetudevhffhhfekjeeiudegtdehueevgfdvgeeivdeifedvnecukfhppedtrddtrddtrddtpdekkedrudeiuddrvdehrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopeguihhrvggtthhorhegrdguvghrphdrmhgrihhlqdhouhhtrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhlvggushesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeife
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 21/06/2023 21:33, Lee Jones wrote:
> On Fri, 16 Jun 2023, Jean-Jacques Hiblot wrote:
> 
>>   create mode 100644 drivers/leds/rgb/leds-group-multicolor.c
> 
> Sorry to do this too you, but there are too many nits that I can't pass by.
That's alright. I'll fix them in the next (hopefully last) round
> 
>> +		/* Restore sysfs access when the multicolor LED is released */
> 

> Out of interest, why are we doing this?
To prevent the user to play with the individual LEDs of the group, their 
sysfs interface is disabled (read-only). The interface must be 
re-enabled when the group is destroyed.
> 
>> +		devm_add_action_or_reset(dev, restore_sysfs_access, led_cdev);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id of_led_group_multicolor_match[] = {
> 
> "leds"
> 
>> +	{ .compatible = "leds-group-multicolor" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, of_led_group_multicolor_match);
>> +
>> +static struct platform_driver led_group_multicolor_driver = {
> 
> "leds"
> 
>> +	.probe		= led_mcg_probe,
>> +	.driver		= {
>> +		.name	= "leds_group_multicolor",
>> +		.of_match_table = of_led_group_multicolor_match,
>> +	}
>> +};
>> +module_platform_driver(led_group_multicolor_driver);
>> +
>> +MODULE_AUTHOR("Jean-Jacques Hiblot <jjhiblot@traphandler.com>");
>> +MODULE_DESCRIPTION("LEDs group multicolor driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:leds-group-multicolor");
>> -- 
>> 2.34.1
>>
> 
