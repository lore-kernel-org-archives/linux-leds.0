Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492670;
	b=ronXHcObjmb65o7h53SW7VfextyPBnMdjfIBDypFcmKuKzCYpzFsXsns9HObnQSd4gFY
	 eWNq4i2FErslBCLRatnZkLm01mrcJSiiLkPO04ZfxtCM8/jCKCf3caVtJdqJXVXxOA7FU
	 DhDj8bOZuNgTtwSHtW9uofiO4RoaUqNKYJH483v+Diy4AQSI81ETCPBD3CXd/Q9kmrWpH
	 NL4nxxVHbWe4F+t+oxZSgToREJKMLK5BoztXNZRx18mS0XEtMjV4c2WNxKgTKCCikUTXR
	 5aAn/7cnMuuX+onxNOygc4DnqfFa7ESYglOp7HDvzM0U1Purya84aGUBBLmWix9nZGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492670;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pQ7BMpJBbKomkOvbdvd4pG9zo1vWZwj/fOjMBE4qlBw=;
	b=dyQxIfanF2fDWzUXokhdi1ONejEhnohzH7buVa4QsH07a0bjMnNIwvsr3dIZ/18+prf1
	 sc399XmhIPyi/K1zYFOP+2U9kxDJTZEmr6bQG3ITtKxlkRW89e+V30HpvNyS+kNWgYHUC
	 KGGtE5SEREz5AS4fTA6l7avseh4EDepGm7WopV8a5D3OSzFhSahEU2ficVUsbt2GKB+vY
	 6QAomQzlcc8u4wqqv1HnXyU+a7vwHVF4xuB9iyC9wFVWbuZ2/kHJAuFKB09dLcvaEuK5s
	 YzSfNOsbP6NzFfKmP/NFre2XDnE5IXuRozQ67Y8kZr0zQ3eW8q+cxrLwAo7dmh5ysEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YHZO7ujt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D7D606A31B;
	Tue, 20 Oct 2026 10:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YHZO7ujt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21531F000C6;
	Tue, 20 Oct 2026 10:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792492669;
	bh=pQ7BMpJBbKomkOvbdvd4pG9zo1vWZwj/fOjMBE4qlBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YHZO7ujtOVIZxltquLVTT1oIJuSNp2iqSJq6Iw6bHLIra+5yetHQHAMeUP8vzbbWm
	 iOdOQ8sjiGcTXkL2K7tq1Ocv8yl23zC52sPX42TKpbonGKHmHYs4EpHClEyVfGpKOZ
	 QwP+a5vnZ6T/EHUva9ZO+gczps6mcfmy3dBmXkHLd7pJlod8/Jn9tNooZLzwoUlbb+
	 BxOkiOnBZmYo+riboRxgkJSZdxV3+M/TSAjmZNr8Gt0BnsndOcUnnk19L6By5f9WI3
	 XxBQEsz7A3CMUCXP6DOMh3rFz/hJYte6MbnK1iSuNOID/Rh3voT07pSHQNhoLP7BMH
	 BHiamWTYnavWw==
Date: Tue, 20 Oct 2026 11:37:44 +0100
From: Lee Jones <lee@kernel.org>
To: Rillian Grant <rillian.grant@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 3/4] leds: flash: lm3643: Describe the LED of ACPI
 boards without LED nodes
Message-ID: <20261020103744.GA1795367@google.com>
References: <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-4-rillian.grant@gmail.com>
 <sashiko-outbox-167402@kernel.org>
 <37Wk96VpSLOh-P0MeN457Q@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37Wk96VpSLOh-P0MeN457Q@gmail.com>

On Tue, 13 Oct 2026, Rillian Grant wrote:

> > [Severity: High]
> > Is there a potential race condition here when multiple devices probe
> > concurrently?
> > 
> > If two threads execute lm3643_add_dmi_leds() simultaneously (for example,
> > during concurrent sysfs bind or async probe of two LM3643 devices matching
> > the same DMI table), they both might pass the lockless
> > software_node_fwnode(nodes[0]) check before either registers the nodes.
> 
> This condition is currently unreachable. It would require two LM3643
> instances on the same DMI entry.
> 
> I'd be happy to add a static mutex if preferred, or alongside any future
> DMI entry for a board with more than one LM3643.

Please.

-- 
Lee Jones
