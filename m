From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v5 2/2] leds: lm3601x: Introduce the lm3601x LED driver
Date: Mon, 14 May 2018 14:40:29 -0500
Message-ID: <86c2bc2f-e622-9447-e4bb-b4ee37e2d44a@ti.com>
References: <20180510174717.26540-1-dmurphy@ti.com>
 <20180510174717.26540-2-dmurphy@ti.com>
 <41267191-1308-6b9b-78fa-2893a525b49a@gmail.com>
 <17630aca-1225-df61-7a5d-a921ecd9c78c@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <17630aca-1225-df61-7a5d-a921ecd9c78c@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, pavel@ucw.cz, afd@ti.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Jacek

On 05/11/2018 06:56 AM, Dan Murphy wrote:
<snip>

>>> +    }
>>> +
>>> +    if (led->strobe_node) {
>>> +        ret = of_property_read_string(led->strobe_node, "label", &name);
>>> +        if (!ret)
>>> +            snprintf(led->strobe, sizeof(led->strobe),
>>> +                "%s:%s", led->strobe_node->name, name);
>>> +        else
>>> +            snprintf(led->strobe, sizeof(led->strobe),
>>> +                "%s::strobe", led->strobe_node->name);
>>> +
>>> +        ret = of_property_read_u32(led->strobe_node,
>>> +                    "flash-max-microamp",
>>> +                    &led->strobe_current_max);
>>> +        if (ret < 0) {
>>> +            led->strobe_current_max = LM3601X_MIN_STROBE_I_MA;
>>> +            dev_warn(&led->client->dev,
>>> +                 "flash-max-microamp DT property missing\n");
>>> +        }
>>> +
>>> +        ret = of_property_read_u32(led->strobe_node,
>>> +                    "flash-max-timeout-us",
>>> +                    &led->max_strobe_timeout);
>>> +        if (ret < 0) {
>>> +            led->max_strobe_timeout = strobe_timeouts[0].reg_val;
>>> +            dev_warn(&led->client->dev,
>>> +                 "flash-max-timeout-us DT property missing\n");
>>> +        }
>>
>> Common LED bindings state that flash-max-microamp and
>> flash-max-timeout-us properties are mandatory.
> 
> OK.

OK I looked at the max776973 driver and well if the flash-max-microamp and
flash-max-timeout-us nodes are missing it sets a default value for each if the
node is not present.

So should we remove this code from the Max77693 driver too and fail probe as being asked
in this driver?

Dan

> 
>>
>>> +
>>> +        lm3601x_init_flash_timeout(led);

<snip>

>>>
>>
> 
> 


-- 
------------------
Dan Murphy
