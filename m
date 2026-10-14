Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D07B3F926D;
	Wed, 14 Oct 2026 09:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969458; cv=none; b=Su5jCJ8NVLeE6A2SLDuFGOtUoogrkmnRteukYRIBf2W2nyiI5vJCgqBMiMBAMq9UM/JlDumU60ElcDAPWO8vnkTzOPMlsp6CplHy0P+ZvKdK4SR8fWOQg6/LRsKidEy1HzTmJa8FD+zPEIpCitzR18zfxWBl+H3YnLFN7D4ZAlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969458; c=relaxed/simple;
	bh=0tdSucTkmERkpeUNqe/vI55Asi2PZpPvr9R2GaA7yu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFD4Eoy2J4TB1ZDlcTKZi8HkDHS8tu9QdCO5L4FTWIxcd1H2IVRt0wAyur/vaVfDY84ftue8ViS4uQl9T40HniiPHuj3eSAtdaUv4Cge1LW19iUJjd1GQ3Nywt9JwALY69pFuBEe9EjKmjcrjqA5yLc771rq1SMDxmkHd9gs2e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyE1O9UN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyE1O9UN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4197C1F000FF;
	Wed, 14 Oct 2026 09:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791969457;
	bh=0QZ2EpwtEStjdAyye9htArcUFPwS1MI2Qe4bTSgUr3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gyE1O9UN6xVoG2JdFStLz64CuNSLbke6pOxSSxRbS1H93p7ICXas6/k7Zo6PjAAgV
	 GYbrLX4USO6rh20vrEeJhujKNrxoAj0A8VYhVG5aHx6x6GlP3xa4Fv5zBk3kHo+UXo
	 4/W5LRr53k6W1l076creD0ijQ3Z1EGaIHFcf7WDlJtYKLBQfPN2FYJcwJeFC3UZBAk
	 HK7CKZYBnRXOrVhe9zqvN1BEq1msOeB1xY8vaxHtl+kdt+Voao/cUYCEpsa7csAsM1
	 7D2KO3wtlIaGDAuzGDEuJueZpJ4Qzvd1s8ONZ3JHY/uQMWhPRhozswPBSibVuBoxKh
	 D1X2WZZ3dOBeg==
Date: Wed, 14 Oct 2026 10:17:32 +0100
From: Lee Jones <lee@kernel.org>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
Message-ID: <20261014091732.GH199624@google.com>
References: <20261007085457.98762-1-clamor95@gmail.com>
 <20261007085457.98762-3-clamor95@gmail.com>
 <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com>
 <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
 <4abc72fd-c645-4410-9387-3f03c751fd3c@gmail.com>
 <CAPVz0n1YKV84J6eG9juM_V5kLCy63WY0hmicUmyEXZp2eEHKyw@mail.gmail.com>
 <f7475c9d-8dda-4dd7-9d11-4b981de1b7f8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7475c9d-8dda-4dd7-9d11-4b981de1b7f8@gmail.com>

On Tue, 13 Oct 2026, Jacek Anaszewski wrote:

> On 10/12/26 9:25 AM, Svyatoslav Ryhel wrote:
> > нд, 11 жовт. 2026 р. о 20:35 Jacek Anaszewski <jacek.anaszewski@gmail.com> пише:
> > > 
> > > On 10/11/26 3:55 PM, Svyatoslav Ryhel wrote:
> > > > нд, 11 жовт. 2026 р. о 16:28 Jacek Anaszewski <jacek.anaszewski@gmail.com> пише:
> > > > > 
> > > > > Hi Svyatoslav,
> > > > > 
> > > > > On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> > > > > > Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
> > > > > > inhibition.
> > > > > > 
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >     Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
> > > > > >     1 file changed, 4 insertions(+)
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > > > > > index a65d92522c9cf..596b5e284f44a 100644
> > > > > > --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > > > > > @@ -31,6 +31,10 @@ properties:
> > > > > >         maxItems: 1
> > > > > >         description: FL_EN pin
> > > > > > 
> > > > > > +  flinh-gpios:
> > > > > > +    maxItems: 1
> > > > > > +    description: FLINH pin
> > > > > > +
> > > > > 
> > > > > You don't seem to make use of it in your patch.
> > > > > 
> > > > 
> > > > I don't have to use it in my patch. This change completes and improves
> > > > hardware description of the AAT1290/1270.
> > > 
> > > Still, If we don't have the use case I'd avoid adding it to not confuse
> > > people looking for its use in the driver.
> > > 
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/writing-bindings.rst?h=next-20261009#n17
> > 
> > - DO attempt to make bindings complete even if a driver doesn't
> > support some features. For example, if a device has an interrupt, then
> > include the 'interrupts' property even if the driver is only polled
> > mode.
> > 
> > - DON'T refer to Linux or "device driver" in bindings. Bindings should
> > be based on what the hardware has, not what an OS and driver currently
> > support.
> 
> I'll leave it to the maintainer.

DT should be OS agnostic and driver orthogonal.  So long as it
accurately and indisputably describes the H/W, then I think it's fair
game.

Is `flinh` a datasheet term or did we make this up?

-- 
Lee Jones
