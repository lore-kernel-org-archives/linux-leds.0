From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [RFC 04/19] dt: bindings: Add lens-focus binding for image sensors
Date: Tue, 18 Jul 2017 22:03:46 +0300
Message-ID: <20170718190401.14797-5-sakari.ailus@linux.intel.com>
References: <20170718190401.14797-1-sakari.ailus@linux.intel.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170718190401.14797-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: linux-leds@vger.kernel.org, laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se, hverkuil@xs4all.nl
List-Id: linux-leds@vger.kernel.org

The lens-focus property contains a phandle to the lens voice coil driver
that is associated to the sensor; typically both are contained in the same
camera module.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/video-interfaces.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index 9723f7e1c7db..a18d9b2d309f 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -74,6 +74,8 @@ Optional properties
 - flash: phandle referring to the flash driver chip. A flash driver may
   have multiple flashes connected to it.
 
+- lens-focus: A phandle to the node of the focus lens controller.
+
 
 Optional endpoint properties
 ----------------------------
-- 
2.11.0
