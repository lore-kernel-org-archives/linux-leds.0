From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v10 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Mon, 11 Jul 2016 15:10:07 +0200
Message-ID: <57839AAF.6070805@samsung.com>
References: <1468234129-26890-1-git-send-email-tony.makkiel@daqri.com>
 <57838227.7070401@samsung.com> <5783857B.1030208@daqri.com>
 <57838C2D.4060607@samsung.com> <57838F26.9050100@daqri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44654 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932115AbcGKNKM (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 11 Jul 2016 09:10:12 -0400
In-reply-to: <57838F26.9050100@daqri.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tony <tony.makkiel@daqri.com>
Cc: linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org, rpurdie@rpsys.net, rjw@rjwysocki.net, lenb@kernel.org, mika.westerberg@linux.intel.com

On 07/11/2016 02:20 PM, Tony wrote:
>
> Thank you for the comments Jacek.
[...]
>>>>> +static int lp3952_set_pattern_gen_cmd(struct lp3952_led_array *priv,
>>>>> +                      u8 cmd_index, u8 r, u8 g, u8 b,
>>>>> +                      enum lp3952_tt tt, enum lp3952_cet cet)
>>>>> +{
>>>>> +    int ret;
>>>>> +    struct ptrn_gen_cmd line = {
>>>>> +        .r = r,
>>>>> +        .g = g,
>>>>> +        .b = b,
>>>>> +        .cet = cet,
>>>>> +        .tt = tt
>>>>> +    };
>>>>> +
>>>>> +    if (cmd_index >= LP3952_CMD_REG_COUNT)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    ret = lp3952_register_write(priv->client,
>>>>> +                    LP3952_REG_CMD_0 + cmd_index * 2,
>>>>> +                    line.bytes.msb);
>>>>> +    if (ret)
>>>>> +        return ret;
>>>>> +
>>>>> +    return (lp3952_register_write(priv->client,
>>>>> +                      LP3952_REG_CMD_0 + cmd_index * 2 + 1,
>>>>> +                      line.bytes.lsb));
>>
>> These brackets are redundant.
>>
>>>>> +}
>>>>> +
>>>>> +static int lp3952_configure(struct lp3952_led_array *priv)
>>>>> +{
>>>>> +    int ret;
>>>>> +
>>>>> +    /* Disable any LEDs on from any previous conf. */
>>>>> +    ret = lp3952_register_write(priv->client, LP3952_REG_LED_CTRL,
>>>>> 0);
>>>>> +    if (ret)
>>>>> +        return ret;
>>>>> +
>>>>> +    /* enable rgb patter, loop */
>>>>> +    ret = lp3952_register_write(priv->client,
>>>>> LP3952_REG_PAT_GEN_CTRL,
>>>>> +                    LP3952_PATRN_LOOP | LP3952_PATRN_GEN_EN);
>>>>> +    if (ret)
>>>>> +        return ret;
>>>>> +
>>>>> +    /* Update Bit 6 (Active mode), Select both Led sets, Bit [1:0] */
>>>>> +    ret = lp3952_register_write(priv->client, LP3952_REG_ENABLES,
>>>>> +                    LP3952_ACTIVE_MODE | LP3952_INT_B00ST_LDR);
>>>>> +    if (ret)
>>>>> +        return ret;
>>>>> +
>>>>> +    /* Set Cmd1 for RGB intensity,cmd and transition time */
>>>>> +    return (lp3952_set_pattern_gen_cmd(priv, 0, I46, I71, I100, TT0,
>>>>> +                       CET197));
>>
>> Ditto.
>>
>> If you agree I can remove them and take the patch.
>
> Yes please :). Thank you for your help.


Patch applied to the for-next branch of linux-leds.git.

Thank you for your effort and determination in submitting
subsequent versions.

-- 
Best regards,
Jacek Anaszewski
