Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6B859651C;
	Thu, 17 Sep 2026 14:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654198; cv=none; b=cebui5VZgGix2aHtTPL7AL9a0l8C32w5jxAs08gRMCoLEXF8Uh5Qz0lJwn1V6GG3uzwTHae+BLn1ond5PNRTGd0j4/bgqo8cmfsfY8SWsNTOnjjin8wRpkziWEGz+t8ALL9HlCi+W5JjsYBjXDFpEwQ4SqqqhXQcu2fAtKcbs+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654198; c=relaxed/simple;
	bh=bsGjFigINEUhbch06eRmFtBBlK7azayyXXkyJIvffGo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hTx7zVr1ba8g709/LBqIyXTFWp0C4+1D1XX5qzZgbQjykJBTE37Jh9Gv+k7oGmHAo55PchL7++K1cb5fAS3ikvJEnQFG8vWDTaL6JMSxj3xjpA6i6vj796iDl6bPdwI0kegw+ivVMCpIYejsdN8HI+HBpzlB8QKfC5Vgc1XeFOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8v1vqwj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8v1vqwj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C9D1F00893;
	Thu, 17 Sep 2026 14:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789654188;
	bh=PyaP1Qdo64iPUZAnXrL/NEPfLBVT5RyNgbaAOiB6Kak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Y8v1vqwjGXbInumgupBJx+2Q0SBiqX16jZ5QzcclwSG2JUphnZxL6lZF5Ut1f9ZC+
	 hplQy8vIVe2gaPbN4uJ6rMqjtDjuKa9lekBsvqOfobckUl45i+rxxYzrs4+kMttotP
	 M8qOIAzVfh+kfeyOkNhXYZee/13iaEltSLTlpPQew/vI50cj+NGFpkla7M4QJJZnxj
	 B5CzdVz7Qx+K6aH4czJXsdEj/E12FL6P67RMNHAG5/tJqXMpsROI8FBbWtluFUQ3vS
	 FjKnpAU8ee+N4yr12e/Sm3Ze1R4kUh9Fmbf4JGRZOPhrKEjYjk2/XaMR+WJ+yOCxJJ
	 5LA20o3U0i+Pw==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260907201940.40524-1-rosenp@gmail.com>
References: <20260907201940.40524-1-rosenp@gmail.com>
Subject: Re: (subset) [PATCH] leds: is31fl32xx: Use fwnode/device property
 APIs
Message-Id: <178965418765.2335433.10560045691479914205.b4-ty@b4>
Date: Thu, 17 Sep 2026 15:09:47 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 07 Sep 2026 13:19:40 -0700, Rosen Penev wrote:
> Convert the DT-specific helpers in is31fl32xx_parse_dt() and
> is31fl32xx_parse_child_dt() to their fwnode/device equivalents.
> Behaviour is unchanged for device tree: device_property_read_bool(),
> device_for_each_child_node_scoped() and device_get_child_node_count()
> operate on the same nodes and keep the skip of unavailable children.
> 
> Use the %pfwP format specifier in error messages, as child is now a
> struct fwnode_handle and %pOF would misread it as a device_node.
> 
> [...]

Applied, thanks!

[1/1] leds: is31fl32xx: Use fwnode/device property APIs
      commit: 57d0756f1cd0332b003aa2cbac16b9d7753acd59

--
Lee Jones [李琼斯]

