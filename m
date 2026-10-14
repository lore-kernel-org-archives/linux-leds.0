Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4161144C51A;
	Wed, 14 Oct 2026 15:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993165; cv=none; b=WY7x0wJaGhf2Zr4I4WVOPjMGaNdhbgaRJQ/tP9Vg9JrlrB1Gyb3Bk8myg1+wBWpUCkAHwZsPJUYp7n9VEJcQX7cbKH1pCiS8hIakNC06Dhvc4oXVApMs9dFUPp3qe4kJz2wJ9WdY0c1a670QI1A/tXdSu7fNHY7uEZszjf54uZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993165; c=relaxed/simple;
	bh=ckNoJGl3xDUfZQnMlt3azT1A2n31xtGj7/bOFOW13AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGPF6u6m/jlgRl2dKgc9bTmgDPMp9ZGUADqgXDnGnLvBvSGpb9Br1ctAs3epBDqHjuyUNTICTEmIM+/kg7YHivP3WPt9gst+WrEVaPt7C35D9ZWwvgc/SNX3UUfVQNtsck8hcW5juJ8DU5HAmkXA032gyMY+tL3pGVhLwhcXWNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Do/xabHX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Do/xabHX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C841F000C4;
	Wed, 14 Oct 2026 15:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791993163;
	bh=QHI+w+N2GnlKF/Y0LmPEX4vAnVi2TAOaiB63zxcpERE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Do/xabHXc7f5BZaH7h+q/6l/XzRDz6s05kzMAlDdEaZTIXCGCW8h6gMxv/dNsbkF5
	 G3adps4AKFzm+kepgwbuh4gFzcZdyoGaxQBMeeKFerGurLIOmpnr//BLGIeljHq7Yk
	 W5ZirdyDpoenPp1UGELi1bYup7PvBwKdDl4RtL3SOmmi8tsoDswlK7piunKXOeAGV1
	 Xv45MaRSpmR1AEaod4a4qhrprddFULmZArepbU1Hx5mvfDMATs9yDxnj0+nwpnWDep
	 1GBynugv6djm05AMIzRjoHDgrJCX4ua9EfjFXAHxhPA4teJttaUeLj7Cd44idhMlKU
	 epX8ZaknHI6Fg==
Date: Wed, 14 Oct 2026 16:52:39 +0100
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
Message-ID: <20261014155239.GC1182143@google.com>
References: <20261007085457.98762-1-clamor95@gmail.com>
 <20261007085457.98762-3-clamor95@gmail.com>
 <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com>
 <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
 <4abc72fd-c645-4410-9387-3f03c751fd3c@gmail.com>
 <CAPVz0n1YKV84J6eG9juM_V5kLCy63WY0hmicUmyEXZp2eEHKyw@mail.gmail.com>
 <f7475c9d-8dda-4dd7-9d11-4b981de1b7f8@gmail.com>
 <20261014091732.GH199624@google.com>
 <CAPVz0n3-=xn0Hy3BgPintGoONVO2NKyENYDQ_jSnM_Awxowjhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n3-=xn0Hy3BgPintGoONVO2NKyENYDQ_jSnM_Awxowjhw@mail.gmail.com>

On Wed, 14 Oct 2026, Svyatoslav Ryhel wrote:

> ср, 14 жовт. 2026 р. о 12:17 Lee Jones <lee@kernel.org> пише:
> >
> > On Tue, 13 Oct 2026, Jacek Anaszewski wrote:
> >
> > > On 10/12/26 9:25 AM, Svyatoslav Ryhel wrote:
> > > > нд, 11 жовт. 2026 р. о 20:35 Jacek Anaszewski <jacek.anaszewski@gmail.com> пише:
> > > > >
> > > > > On 10/11/26 3:55 PM, Svyatoslav Ryhel wrote:
> > > > > > нд, 11 жовт. 2026 р. о 16:28 Jacek Anaszewski <jacek.anaszewski@gmail.com> пише:
> > > > > > >
> > > > > > > Hi Svyatoslav,
> > > > > > >
> > > > > > > On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> > > > > > > > Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
> > > > > > > > inhibition.
> > > > > > > >
> > > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > ---
> > > > > > > >     Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
> > > > > > > >     1 file changed, 4 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > > > > > > > index a65d92522c9cf..596b5e284f44a 100644
> > > > > > > > --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > > > > > > > +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > > > > > > > @@ -31,6 +31,10 @@ properties:
> > > > > > > >         maxItems: 1
> > > > > > > >         description: FL_EN pin
> > > > > > > >
> > > > > > > > +  flinh-gpios:
> > > > > > > > +    maxItems: 1
> > > > > > > > +    description: FLINH pin
> > > > > > > > +
> > > > > > >
> > > > > > > You don't seem to make use of it in your patch.
> > > > > > >
> > > > > >
> > > > > > I don't have to use it in my patch. This change completes and improves
> > > > > > hardware description of the AAT1290/1270.
> > > > >
> > > > > Still, If we don't have the use case I'd avoid adding it to not confuse
> > > > > people looking for its use in the driver.
> > > > >
> > > >
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/writing-bindings.rst?h=next-20261009#n17
> > > >
> > > > - DO attempt to make bindings complete even if a driver doesn't
> > > > support some features. For example, if a device has an interrupt, then
> > > > include the 'interrupts' property even if the driver is only polled
> > > > mode.
> > > >
> > > > - DON'T refer to Linux or "device driver" in bindings. Bindings should
> > > > be based on what the hardware has, not what an OS and driver currently
> > > > support.
> > >
> > > I'll leave it to the maintainer.
> >
> > DT should be OS agnostic and driver orthogonal.  So long as it
> > accurately and indisputably describes the H/W, then I think it's fair
> > game.
> >
> > Is `flinh` a datasheet term or did we make this up?
> >
> 
> You can check yourself if you don't believe me. Both AAT1270 and
> AAT1290 can be found freely.

I'd rather just ask you and trust the answer.

> FLINH pin #10
> 
> Flash inhibit pin. FLINH is an active HIGH control input with an
> internal 200kΩ resistor to AGND. A low-to-high transition on the FLINH
> pin reduces FL sink current to the maximum (default) movie-mode
> current level for the duration of FLINH. Strobing the FLINH pin low to
> high does not reset the flash timer.

Okay, thanks.

-- 
Lee Jones
