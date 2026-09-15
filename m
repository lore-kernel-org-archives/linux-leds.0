Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C96A351C20;
	Tue, 15 Sep 2026 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468126; cv=none; b=f8Kk4h+WtOgFQBNRgPMALROInlP5DeQ5snz1TrjYVjCPZlJ9ZILAl7gWyo5k/BIOf9WCacft++UnI/nV8cfnK8PJPrNxfVxHZ8NnpInu+humv4q5eXIj+ZIzWedmHHGYlFwqCauowf6HAHkqTc9Xs54twKpojLd86T3s2sXaHZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468126; c=relaxed/simple;
	bh=jYUuyaxap45YWktNnApW6hsSz3P+QMWv3MzYTLKhvn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dPny5mjrwGHUTsc6aqD5Ue16vdb55/SHegUuchtYlAKCijzkD+oJXDDIsCEk7tBLVLi8WbAHVFlwmZJtBamFdAxY//r6wLeKopBDtZyEde9nV0tGGwRwVsxXTqQcqH/6My/JNgMlDEjz04DVb4BA6isivlieDu0EtiPK3ll8OdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofER0sHq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofER0sHq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39DA1F000FF;
	Tue, 15 Sep 2026 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789468124;
	bh=syFNOvFuqCHRPJWBM4ggaf2cVtoimRROGoRy3ic9eLQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ofER0sHqmC2xw3BMJAvR6Ugm28Sbl7XPGrPe0LQKFkO+9yoIcJ2Fhm1wbuRFF3XjP
	 22DjNGwf6XL3ymWKSS+lNphWBNLffK/0Vw4eXFBTnXVT2hluLouTiB5z5nI0UdCL7d
	 uHJbkkAswv14AYZAlVmnMS44C8gedUp40oNXK2JdTQjjqmLoN4UQl0Vdkdi3BGgY+C
	 tWptz8QQxBw/ciR/w7q8mYs6cWcgDGbbM2jm9ZV2UfJTkW3xFAAMnQP9vNiZ6FsEJ0
	 7kjRaul0nkrCY4yltrlqbZ4F1AntBo6CMaA9u2Y0fUZU1bmPzzTsL4BbM+ac1dfud6
	 cRGx9nW7HXg1w==
Message-ID: <f3c9d7aa-f158-42e6-a1a5-b88c28daa941@kernel.org>
Date: Tue, 15 Sep 2026 12:28:38 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: leds: pca995x: describe output-gain
 property
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>, lee@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 linux@ew.tq-group.com
References: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
 <7f61e7e8781292450f920c49ef8853b802d76ecc.1788350618.git.nora.schiffer@ew.tq-group.com>
 <20260902123105.11B171F000E9@smtp.kernel.org>
 <630889485b7be21875c858c705e1c9d828973c67.camel@ew.tq-group.com>
 <20260903-sophisticated-magic-fennec-7c8aeb@quoll>
 <31aace01ed19712b2984890adf61144a80cf7f42.camel@ew.tq-group.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <31aace01ed19712b2984890adf61144a80cf7f42.camel@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/09/2026 10:23, Nora Schiffer wrote:
> On Thu, 2026-09-03 at 15:09 +0200, Krzysztof Kozlowski wrote:
>> On Wed, Sep 02, 2026 at 03:10:09PM +0200, Nora Schiffer wrote:
>>> On Wed, 2026-09-02 at 12:31 +0000, sashiko-bot@kernel.org wrote:
>>>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>>>> - [Low] The custom, device-specific property `output-gain` lacks a mandatory vendor prefix.
>>>
>>> Probably makes sense to add the vendor prefix, will do in v2.
>>>
>>>> - [Low] The `output-gain` property incorrectly exposes a raw hardware register value directly to the Device Tree instead of describing physical units.
>>>
>>> According to the datasheet, the LED current is calculated as follows:
>>>
>>>     Iled = output_gain * 900mV / Rext / 4
>>>
>>> If we want to fully describe the output gain using physical units, something
>>> like output-current-microamps and external-resistor-ohms would work. There
>>> wouldn't be a meaningful default for these properties to describe in the binding
>>> docs however, which is possible for "output-gain" (as the driver just sets that
>>> to 127.)
>>
>> Output current is already there, no? led-max-microamp? So basically you
>> would be re-describing it... although I understand that for your case
>> you need two properties (also the resistor) to calculate the value to program.
> 
> One other idea I had was to treat the output gain as a single value, but handle
> the constant factor in the driver, so it defines just the Iled * Rext term with
> unit microvolts. This could be used in the Device Tree as follows:
> 
>     /* Configure an output current of 15000uA for Rext = 3000Ohm */
>     nxp,output-gain-microvolts = <(15000 * 3000)>;
> 
> Two notes regarding this approach:
> 
> - These "microvolts" do not correspond to any actual voltage, but the full
>   "microamps-ohms" seems very verbose.
> - It is unclear to me whether using physical units actually makes this binding
>   more generic. I have not worked with other LED drivers, so I don't know how
>   common the concept of a gain that relates the current with an external
>   resistor is.


I think vendor,output-gain in register values is fine in such case.


Best regards,
Krzysztof
