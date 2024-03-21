Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A6485650;
	Thu, 21 Mar 2024 14:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711033161; cv=none; b=jANEKK9mhkpkU4Oqwl+azSpriL3xKky/9UU2R40KQ60KGpIy1RXvV6btTQpd4LhJ86ViCl989pdk7bVWBiGhIiJiNBhafLXNElFC4frVDUb6lKN4DFrGc/3g6bad88iTZvatHczT9xzh20zWJkPVr133FucRx6zXYPF31YDlIFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711033161; c=relaxed/simple;
	bh=Nz9OfYvrur6nou4pNIOYZtLhK+8oHGW5EWI0IUKNg4c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qDSEJOb9biuLxlp3dZFUv42bEGlt9gnDUxx6Cq7o1jPC0YtjF5gkTUqxS4x0sk4bX32o40dBcnVp7REKWCb5u9fK8hRoGyNn+C5VFm6fYgMOy/vDSWHK6NkjOL3vtLvg0+Zpx9PzaE8boy7MxAh1Ly19u7xMvY1kQqaBdUHnTGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhTBSDJF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhTBSDJF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F42C433C7;
	Thu, 21 Mar 2024 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711033160;
	bh=Nz9OfYvrur6nou4pNIOYZtLhK+8oHGW5EWI0IUKNg4c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PhTBSDJFF8HdyfkkGyOgAs6CocZT9MLYaIPiLiXTbTc+lavnu03+adwii8zKx6ICa
	 ce53dZ+3C2tr/AH6gqIhSuCHTBdSkr+DiBuExOVY9eNUzir0ZTTLh92+vA8DlfyIjC
	 78gK1x1kaywmc4XRaysBzj/RJyCdTv2EC7oznVn9f4ZvS1+BA1b2JouEryCoGZLPQR
	 GzrGvTdJSCaBD4RvDTJbE65zHRuXiqSPtQYE7jzmvPKNVYKsaOiJiBN79oQf1HvspP
	 cgjltwxh+bZjCdFFPN8ZQU+mxqijLprG5yzo4IV5k8wg+iaMJs0eq2ipnsND2bNF0P
	 2WxIUvbCViJxQ==
From: Lee Jones <lee@kernel.org>
To: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anders Darander <anders@chargestorm.se>, 
 Matt Ranostay <mranostay@gmail.com>, Peter Meerwald <pmeerw@pmeerw.net>, 
 Ricardo Ribalda <ribalda@kernel.org>
In-Reply-To: <20240305004501.849-1-laurent.pinchart@ideasonboard.com>
References: <20240305004501.849-1-laurent.pinchart@ideasonboard.com>
Subject: Re: (subset) [PATCH] dt-bindings: leds: pca963x: Convert text
 bindings to YAML
Message-Id: <171103315829.46862.417559829428388360.b4-ty@kernel.org>
Date: Thu, 21 Mar 2024 14:59:18 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Tue, 05 Mar 2024 02:45:01 +0200, Laurent Pinchart wrote:
> Convert the pca963x DT bindings to YAML schema. The existing properties
> are kept without modification, but the example is adapted to the latest
> common bindings for LEDs.
> 
> 

Applied, thanks!

[1/1] dt-bindings: leds: pca963x: Convert text bindings to YAML
      commit: 779027a0a7392610cbfd3210836d6b0e6ddef434

--
Lee Jones [李琼斯]

