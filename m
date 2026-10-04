Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A6739FCB1;
	Sun,  4 Oct 2026 14:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124256; cv=none; b=uParkEqkZDg9/J8+6hjzypMTHOWy+i3BBJRvzA0rUwGGexpzUxCPXkMIyW7V0UZphm/IxRfDHsvo37O6a7qvw0qkQoMJAbP0lNT3jICC0O5r3g/lAVqp3y2ypvq4QujuNqS1A+rSROWWVYnAQm+GWS5bMj1vPtPHx6drv4KnM9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124256; c=relaxed/simple;
	bh=YNbxPIQ7p8bv7Fhpg0feU9GPIOMaC/eJGtbmMcGjXEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cbKT5bzWgSW7OdA5I+BTiKiTLQsBh8csqSVm3wepNLd/WPtQpioawaqgV9KLewT0aM0gbteliRpgA1FFS3z9j4c0MiQ38re3vlLBoyMcYoihI2jzUAvgYkbSbi0XMGwnwNsf0r1GiqB6kXSZKQI/H28XJXxEe7aMeJRpmSxbr0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ss5jfB3M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ss5jfB3M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1911F000FF;
	Sun,  4 Oct 2026 14:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791124254;
	bh=zP++n2LFI62vOgMuMM5u+RRnuthrPhN3WpLjzJ84R2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ss5jfB3MhhsRyHTAF6FsSmuUzGjA1uPrPc4H7K5us8XNZbF6hMOcusHgQv4RiJ4V6
	 nAu8uBzE1XhUNAOO8KFN3H1mQ4pVANpgxIHDUyI5YazZpnOTiF9EaNwn/3A8+/MRor
	 opfkhMKG99d36YuBTQYpQACfURdt87wlfoFdEfmUYHXo7OUYhRIT8//gkjXVOy/Oi4
	 0MuyfmZyLteevlR31/jWp7BMT2s9PPhC3nPAYZZVlo8Q62BVz02zzNgA/jwCK3ZqC4
	 bLm88iKCGu+qEhefu/UWEm6ELvoIyOYR/UiUsdWV4/DUAk21fOETlC0hd8IFJRuvxQ
	 B1IeQhteYwuJA==
Message-ID: <5b34d2da-6e53-4a93-9d08-7d64e9072562@kernel.org>
Date: Sun, 4 Oct 2026 16:30:48 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,netxbig-leds: Convert to DT
 schema
To: Uday Kiran <challauday369@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260901170358.176103-1-challauday369@gmail.com>
 <20260909-arcane-yellow-beluga-5ce6f7@quoll>
 <CAAj-GBkiTvFwx+3htJaKGFCYAC0jGdhyxkfUa8dKWPkYmbGViw@mail.gmail.com>
 <f402d93f-4443-4209-a6c7-5c30e7c8751a@kernel.org>
 <CAAj-GBnyFnVhNpuPTBoQhBZJLUYdXnBcxnEYy8rsYqkqX=UK7g@mail.gmail.com>
 <82b71784-4bb9-4165-a0f0-cf00fedde944@kernel.org>
 <CAAj-GBkPTmSxjKcXrzeMA3bz89vPGHt0Ai4Gat3KSz3epusRjw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <CAAj-GBkPTmSxjKcXrzeMA3bz89vPGHt0Ai4Gat3KSz3epusRjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/10/2026 16:04, Uday Kiran wrote:
> On Wed, Sep 16, 2026 at 11:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 14/09/2026 19:58, Uday Kiran wrote:
>>> On Sat, Sep 12, 2026 at 1:20 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 11/09/2026 16:29, Uday Kiran wrote:
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    const: lacie,netxbig-leds
>>>>>>> +
>>>>>>> +  gpio-ext:
>>>>>>> +    description: Phandle for the gpio-ext bus.
>>>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>>>> +
>>>>>>> +  timers:
>>>>>>> +    description: |
>>>>>>> +      Timer array. Each timer entry is represented by three integers:
>>>>>>> +      Mode (gpio-ext bus), delay_on and delay_off.
>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>>>> +
>>>>>>> +patternProperties:
>>>>>>> +  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":
>>>>>>
>>>>>> This is an odd pattern. Why is pinctrl an LED? or gpio-ext?
>>>>>>
>>>>>> Actually entire pattern is very odd - it has $ in the middle, but then
>>>>>> followed with other REQUIRED stuff. I am surprised it works, but
>>>>>> regardless it is absolutely not readable. Looks like a begative pattern,
>>>>>> but why would you have negative pattern for known properties?
>>>>>
>>>>> Thanks for the review Krzysztof.
>>>>>
>>>>> The negative lookahead was added because patternProperties matches all top-
>>>>> level property names that fit the pattern, so excluded known top-level
>>>>> properties like gpio-ext and pinctrl-*;
>>>>>
>>>>> In patch v1, I've used additionalProperties which removes the regex entirely
>>>>> and allows arbitrary child-node names. But removed and used patternProperties
>>>>> as per the review feedback.
>>>>>
>>>>> Could you please suggest to me which way to proceed? with additionalProperties
>>>>> or patternProperties
>>>>
>>>>
>>>> The children are leds, so they should use generic node name pattern like
>>>> "^led-[a-z0-9]+$"
>>>
>>> Yes, Krzysztof but the original binding uses blue-power, red-power,
>>> blue-sata0, etc.
>>> as LED child node names. Would you like me to rename these nodes to
>>> led-blue-power, led-red-power, etc. to use the suggested
>>> ^led-[a-z0-9]+$ pattern,
>>> or should I retain the existing node names and use a more specific
>>> pattern for them
>>> like "^(blue|red)-(power|sata[0-9]+)$"
>>
>> I did not see original binding mentioning any names. Neither in the driver.
> 
> Sorry for the delayed response, Krzysztof.
> 
> You are right that the binding text and the driver do not mandate node names.
> However, the existing device tree source use names like blue-power,
> red-sata0, etc.:
> 
> arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
> 
> Also, the driver uses the node name as a fallback LED label when the label
> property is absent.
> 
> drivers/leds/leds-netxbig.c, lines 585-588.

So what is the problem exactly? You rename the nodes and use label. Does
anything break?

> 
> If we enforce ^led-[a-z0-9]+$ in the schema, the existing DTS file would fail
> validation, and renaming the nodes would change the userspace-visible
> LED names.


Best regards,
Krzysztof
