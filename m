Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD563AA51A;
	Fri, 27 Mar 2026 10:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606704; cv=none; b=aj49Fa0NSPmyvbtsI4hcILIKxVUAkSY+PX/HRU/2O3g2p9WpFax6x+6GCwewyhhL7t5XxBfBS917ObdV7FGjW0mPOyqrgnJIbhcav+9FSNFZebXqj1ZAMbIW/eT9KcdXl6nxE7ofeegTE0AE7jIL1jruOn5gayC14+4cvJD5jOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606704; c=relaxed/simple;
	bh=dWmyZ2OOPQ2BUCAdBYc/CUxw39MM+v14HxWKBs7iNGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFnMw8dseuxeSGgFZVDkHAoWtEDVzUzAIS+4uCvkqwaUq6xqstGfoUnhRC3ilkS5BQaUntbLouJibsYvXzM3wQw3gwEpZdvL+MVeIOmPocnPydBlmfIumpaGdn6oFAxWmnvdGJk4+M+ljbHcbThc9YB+lhCKoeymcJhYoGcUsAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=NpOWVYrh; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="NpOWVYrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1774606700; bh=dWmyZ2OOPQ2BUCAdBYc/CUxw39MM+v14HxWKBs7iNGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpOWVYrhTtOFgRoqhdTq+HCJ0KRwrFai1osUVLS5v6ThnIrDxxSBY+kxjCiZLljIP
	 zEQE6FseQQ+jrmLTFbP1i5OJBsvfqwia2Ns1irYB3m1c1SswiU1V+xoXWeo234RQoj
	 eeVVI26+xns/L4OLalHxlrcdbvbaxKFJ/Mxt70mlWiiwtAaKngzQJQzb9KlRnxq1l4
	 Q2XkGSAQGvY2se0RKqzLMk8Oni+8dXzbRW/CQou8jrcnlgK+WyRr/070khp9nJ9qyz
	 L/7Sk8mus3vlOq5qvPBhARAcHn93kVQTkGtMCriAclPLeE4ggGNnVxkOIM5gji3uE1
	 zssUAoa7y7aEg==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 217CE1011B2; Fri, 27 Mar 2026 10:18:20 +0000 (GMT)
Date: Fri, 27 Mar 2026 10:18:20 +0000
From: Sean Young <sean@mess.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: leds: irled: ir-spi-led: Add new
 duty-cycle value
Message-ID: <acZZbKhXe5kLMfTt@gofer.mess.org>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-4-446c6e865ad6@gmail.com>
 <20260327-natural-wild-mongrel-5bcc43@quoll>
 <acZCrqffLvUpM7AW@gofer.mess.org>
 <ad7a0675-84cc-424a-b583-47c342f02fb0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad7a0675-84cc-424a-b583-47c342f02fb0@kernel.org>

On Fri, Mar 27, 2026 at 10:38:17AM +0100, Krzysztof Kozlowski wrote:
> On 27/03/2026 09:41, Sean Young wrote:
> > On Fri, Mar 27, 2026 at 08:51:18AM +0100, Krzysztof Kozlowski wrote:
> >> On Wed, Mar 25, 2026 at 06:07:27PM +0000, Biswapriyo Nath wrote:
> >>> 30 duty cycle for IR transmitter is used in Xiaomi Redmi Note 8 (ginkgo).
> >>>
> >>> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
> >>> index 72cadebf6e3..0297bfbb275 100644
> >>> --- a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
> >>> +++ b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
> >>> @@ -25,7 +25,7 @@ properties:
> >>>  
> >>>    duty-cycle:
> >>>      $ref: /schemas/types.yaml#/definitions/uint8
> >>> -    enum: [50, 60, 70, 75, 80, 90]
> >>> +    enum: [30, 50, 60, 70, 75, 80, 90]
> >>
> >> Hm, why is this enum, instead of 1-99, in the first place?
> > 
> > Well in reality only a few different duty cycles are used by IR protocols.
> > 30% is quite common so that should part of the list. 
> > 
> > Having said that a range of 1-99 would be nicer. Do we set this like so:
> > 
> >  - minimum: 1
> >  - maximum: 99
> 
> I asked, because I don't know what hardware is really there. This should
> match reality, so if you say continuous range is never used, it does not
> have the be changed to 1-99.

So the transmit hardware can do an continuous range (almost). It's the
real life usage which doesn't really use many different values.

The value set here is just the default duty cycle. There is also an ioctl 
LIRC_SET_SEND_DUTY_CYCLE which sets the duty cycle for transmission.

Most IR drivers just have a hardcoded default value for the duty cycle,
I think ir-spi is the only one which allows this to be set via dt.

I'd say allowing the default to be set via dt is not necessary. If this had
occurred to be during review I would've asked for it to be removed. It's
there now, so:

Reviewed-by: Sean Young <sean@mess.org>

Sean
